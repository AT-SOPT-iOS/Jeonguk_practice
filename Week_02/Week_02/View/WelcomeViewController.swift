//
//  WelcomeViewController.swift
//  Week_1
//
//  Created by 정정욱 on 4/5/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    var id: String?
    
    // MARK: - UIComponent
    
    let mainImage: UIImageView = {
        let Image = UIImageView(frame: CGRect(x: 120, y: 60, width: 150, height: 150))
        Image.image = ImageLiterals.login
        return Image
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 240, width: 236, height: 70))
        label.text = "\(self.id)님\n반가워요"
        label.font = UIFont.Pretendard.head1()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor.Primary_orange
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont.Pretendard.subhead1()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    var reLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 500, width: 332, height: 58))
        button.backgroundColor = UIColor.Gray200
        button.setTitle("다시로그인", for: .normal)
        button.titleLabel?.font = UIFont.Pretendard.subhead1()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addViews()
        //bindID()
        id = ""
    }
    
    // MARK: - Setting
    
    private func addViews() {
        view.addSubviews(mainImage, welcomeLabel, backButton, reLoginButton)
    }
}

//MARK: Action

extension WelcomeViewController{
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil { 
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindID() {
        self.welcomeLabel.text = "\(id ?? "")님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        //self.id = id // 요놈은 왜 타입 표출 일어남? String? 로 선언 되어 있기 때문임
        self.welcomeLabel.text = "\(id ?? "")님 \n반가워요!"
    }
}

#Preview{
    WelcomeViewController()
}
