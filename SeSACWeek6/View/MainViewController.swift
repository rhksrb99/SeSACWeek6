//
//  MainViewController.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/09.
//

import UIKit

import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    let color: [UIColor] = [.red, .blue, .orange, .yellow, .green]
    
    let numberList: [[Int]] = [
        [Int](100...110),
        [Int](55...75),
        [Int](5000...5006),
        [Int](41...50),
        [Int](61...70),
        [Int](21...30)
    ]
    
    var episodeList:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        bannerCollectionView.collectionViewLayout = collectionViewLayout()
        bannerCollectionView.isPagingEnabled = true
        
        TMDBAPIManager.shared.requestImage { value in
            dump(value)
            // 1. 네트워크 통신
            // 2. 배열 생성
            // 3. 받아온 요소 배열에 담아주기
            // 4. 뷰 등에 표현
                // ex. 테이블뷰 섹션, 컬렉션뷰 셀
            // 5. 뷰 갱신!
            self.episodeList = value
            self.mainTableView.reloadData()
        }
        
        
    }

}

// MARK: - tableview delegate

// UICollectionViewDelegateFlowLayout - sizeForItemAt - 역동적인 셀
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodeList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else{return UITableViewCell()}

        cell.titleLabel.text = "\(TMDBAPIManager.shared.tvList[indexPath.section].0) 다시보기"
        
        cell.backgroundColor = .systemIndigo
        // 가장 하단의 색상
        cell.contentCollectionView.backgroundColor = .red
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        // 섹션이 10개이기 때문에 섹션의 수를 사용할 수 있다.
        cell.contentCollectionView.tag = indexPath.section
        cell.contentCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        cell.contentCollectionView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
}

// MARK: - collectionview delegate

// 하나의 프로토콜, 메서드에서 여러 컬렉션뷰의 delegate, datasource 구현해야 함
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == bannerCollectionView ? color.count : episodeList[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        
        if collectionView == bannerCollectionView {
            cell.customView.img_main.backgroundColor = color[indexPath.item]
        }else {
            cell.customView.img_main.backgroundColor = .darkGray
            cell.customView.lb_contents.textColor = .white
//            cell.customView.lb_contents.text = "\(numberList[collectionView.tag][indexPath.item])"
            
            let url = URL(string: "\(TMDBAPIManager.shared.imageURL)\(episodeList[collectionView.tag][indexPath.item])")
            cell.customView.img_main.kf.setImage(with: url)
            cell.customView.lb_contents.text = nil
        }
        
        return cell
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: bannerCollectionView.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return layout
    }
    
}
