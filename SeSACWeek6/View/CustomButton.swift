//
//  CustomButton.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/09.
//

import UIKit

/*
 Swift Attribute (속성)
 @IBInspectable, @IBDesignable, @objc, @escaping
 @available, @discardableResult, etc
 */


// 인터페이스 빌더 컴파일 시점 실시간으로 객체 속성을 확인할 수 있음.
@IBDesignable class CustomButton: UIButton {

    //인터페이스 빌더 인스펙터 영역에 보여진다.
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            // 새롭게 지정된 cornerRadius를 리턴
            return layer.cornerRadius
        }
        set {
            // 새롭게 받아오는 newValue의 값을 이용해서
            // cornerRadius값 지정
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
    
}
