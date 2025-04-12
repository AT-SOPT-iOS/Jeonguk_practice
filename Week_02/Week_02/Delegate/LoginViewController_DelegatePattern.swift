//
//  LoginViewController_DelegatePattern.swift
//  Week_02
//
//  Created by 정정욱 on 4/12/25.
//

import UIKit

class LoginViewController_DelegatePattern: UIViewController, DataBindDelegate {
    
    // MARK: - UIComponent
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont.Pretendard.subhead1()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont.Pretendard.subhead4()
        textField.backgroundColor = UIColor.Gray200
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont.Pretendard.subhead4()
        textField.backgroundColor = UIColor.Gray200
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor.Primary_orange
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = UIFont.Pretendard.subhead1()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addViews()
    }
    
    // MARK: - Setting
    
    private func addViews() {
        view.addSubviews(titleLabel, idTextField, passwordTextField, loginButton)
    }
}

//MARK: Action

extension LoginViewController_DelegatePattern {
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.modalPresentationStyle = .formSheet
    //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.delegate = self
        welcomeViewController.id = idTextField.text
    
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}


//MARK: Delegate

extension LoginViewController_DelegatePattern {
    func dataBind(id: String) {
        passwordTextField.text = "\(id) + 1234 "
    }
}

#Preview{
    LoginViewController_DelegatePattern()
}
