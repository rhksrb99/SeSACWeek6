//
//  CustomView.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/09.
//

import UIKit

/*
 Xml Interface Builder
 재사용성을 위해서 사용
 1. UIview Custom Class를 사용할 수 있다.
 2. File's owner ->
 
 */

/*
 View:
 - 인터페이스 빌더 UI 초기화 구문 required init?
    - 프로토콜 초기화 구문: required > 초기화 구문이 프로토콜로 명세 돼 있음
 - 코드 UI 초기화 구문 override init
 */


class CustomView: UIView {

    @IBOutlet weak var img_main: UIImageView!
    @IBOutlet weak var btn_heart: UIButton!
    
    // 초기화를 해줘야한다!
    // 옵셔널 오류를 해제하기 위한 과정
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .systemIndigo
        
        self.addSubview(view)
        
    }
    
}
