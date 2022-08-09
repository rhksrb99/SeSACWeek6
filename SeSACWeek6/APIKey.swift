//
//  APIKey.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/08.
//

import Foundation

// 구조체와 열거형의 차이
// enum : 초기화 구문이 없다.
// APIKey -> 다른 컴퓨터에서 프로젝트를 작업한다면?
// property list -> API Configuration
enum APIKey {
    static let kakao = "4f277be3c5c26d433b9022b7679ee3c4"
}
