//
//  CustomCollectionViewCell.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/09.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var customView: CustomView!
    
    // 변경되지 않는 UI
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
    }

    func setupUI() {
        customView.backgroundColor = .clear
        customView.img_main.backgroundColor = .blue
        customView.img_main.layer.cornerRadius = 8
        customView.btn_heart.tintColor = .black
        
    }
    
}
