//
//  WelcomeViewController.swift
//  Week_1
//
//  Created by 정정욱 on 4/5/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String?
    
    let mainImage: UIImageView = {
        let Image = UIImageView(frame: CGRect(x: 120, y: 60, width: 150, height: 150))
        Image.image = UIImage(named: "Login")
        return Image
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 240, width: 236, height: 44))
        label.text = "\(self.id)님\n반가워요"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var reLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 500, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("다시로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        //bindID()
        id = ""
    }
    
    private func setLayout() {
        [mainImage, welcomeLabel, backButton, reLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil { // 모달이라는 이야기
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    private func bindID() {
        self.welcomeLabel.text = "\(id ?? "")님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id // 요놈은 왜 타입 표출이 안일어나지?
    }
    
}

#Preview{
    WelcomeViewController()
}
