//
//  ClosureViewController.swift
//  SeSACWeek6
//
//  Created by 박관규 on 2022/08/08.
//

import UIKit

class ClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         오토리사이징을 오토레이아웃 제약조건처럼 설절해주는 기능이 내부적으로 구현이 되어있다.
         이 기능은 디폴트가 true, 하지만 오토레이아웃을 지정해주면 오토리사이징을 안 쓰겠다는 의미인 false로 상태가 내부적으로 변경된다! 오토리사이징 + 오토레이아웃 = 충돌
         코드 기반 UI -> true
         인터페이스 빌더 기반 UI -> false
         autoresizing -> autolayout constraints
         */
        
        
        mainView.img_main.backgroundColor = .lightGray
        mainView.btn_heart.backgroundColor = .systemMint
        // 액션연결이 불가능하기에 addTarget을 구현
        mainView.btn_heart.addTarget(self, action: #selector(heartClicked), for: .touchUpInside)

    }
    
    @objc func heartClicked() {
        print("heartClicked")
    }

    @IBOutlet weak var mainView: CustomView!
    
    @IBAction func colorPickerButtonClicked(_ sender: UIButton) {
        showAlert(title: "컬러피커 띄울거니?", message: nil, okTitle: "응", okAction: {
            let picker = UIColorPickerViewController()
            self.present(picker, animated: true)
        })
    }
    
    @IBAction func bakcgroundColorChanged(_ sender: UIButton) {
        showAlert(title: "배경색 변경할거니?", message: "배경색 변경할거야..?", okTitle: "응", okAction: {
            self.view.backgroundColor = .lightGray
        })
    }
    
}

extension UIViewController {
    func showAlert(title : String, message : String?, okTitle : String, okAction: @escaping () -> () ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: okTitle, style: .default) { action in
            print(action.title)
            self.view.backgroundColor = .lightGray
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
