//
//  MainTableViewCell.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/09.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        contentCollectionView.collectionViewLayout = collectionViewLayout()
        
    }

    func setupUI() {
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.text = "넷플릭스 인기 콘텐츠"
        titleLabel.backgroundColor = .clear
        contentCollectionView.backgroundColor = .clear
        
    }

    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // 높이를 조절하면 한칸의 셀에 들어가는 아이템이 늘어난다.
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return layout
    }
    
}
