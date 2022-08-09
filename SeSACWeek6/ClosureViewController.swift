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
