//
//  TMDBAPIManager.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/10.
//

import Foundation

import Alamofire
import SwiftyJSON


class TMDBAPIManager {
    
    static let shared = TMDBAPIManager()
    // 초기화 방지
    private init() { }
    
    let tvList = [
        ("환혼", 135157),
        ("이상한 변호사 우영우", 197067),
        ("인사이더", 135655),
        ("미스터 션사인", 75820),
        ("스카이 캐슬", 84327),
        ("사랑의 불시착", 94796),
        ("이태원 클라스", 96162),
        ("호텔 델루나", 90447)
    ]
    
    var stillpath:[String] = []
    
    let imageURL = "https://image.tmdb.org/t/p/w500"
    
    func callRequest(query: Int, completionHandler: @escaping ([String]) -> () ) {
        print(#function)
        
        let url = "https://api.themoviedb.org/3/tv/\(query)/season/1?api_key=\(APIKey.tmdb)&language=ko-KR"
        
        // Alamofire -> URLSession Framework ->  비동기로 Request
        
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                
                // 기본적인 포문 사용
//                for ep in json["episodes"].arrayValue{
//                    self.stillpath.append(ep["still_path"].stringValue)
//                }
                
                // 고차함수를 적용하면?
                let value = json["episodes"].arrayValue.map { $0["still_path"].stringValue }
                
                completionHandler(value)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestImage(completionHandler: @escaping ([[String]]) -> ()) {
        
        var posterList: [[String]] = []
        
        // 나중에 배울 내용 : async/await(iOS13 이상)
        TMDBAPIManager.shared.callRequest(query: tvList[0].1) { value in
            posterList.append(value)

            TMDBAPIManager.shared.callRequest(query: self.tvList[1].1) { value in
                posterList.append(value)

                TMDBAPIManager.shared.callRequest(query: self.tvList[2].1) { value in
                    posterList.append(value)
                   
                    TMDBAPIManager.shared.callRequest(query: self.tvList[3].1) { value in
                        posterList.append(value)
                     
                        TMDBAPIManager.shared.callRequest(query: self.tvList[4].1) { value in
                            posterList.append(value)
                           
                            TMDBAPIManager.shared.callRequest(query: self.tvList[5].1) { value in
                                posterList.append(value)
                                
                                TMDBAPIManager.shared.callRequest(query: self.tvList[6].1) { value in
                                    posterList.append(value)
                                    
                                    TMDBAPIManager.shared.callRequest(query: self.tvList[7].1) { value in
                                        posterList.append(value)
                                        completionHandler(posterList)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
//    func requestEpisodeImage() {
//
//        // 어떤 문제가 생길 수 있을까?
//        // 1. 순서보장이 안된다.
//        // 2. 언제 끝날 지 모른다.
//        for item in tvList {
//            TMDBAPIManager.shared.callRequest(query: item.1) { stillPath in
//                print(stillPath)
//            }
//        }
//
//
//        let id = tvList[6].1
//
//        TMDBAPIManager.shared.callRequest(query: id) { stillPath in
//            print(stillPath)
//            TMDBAPIManager.shared.callRequest(query: self.tvList[6].1) { stillPath in
//                print(stillPath)
//            }
//        }
//
//    }
    
}
