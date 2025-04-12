//
//  LoginViewController_Closure.swift
//  Week_02
//
//  Created by 정정욱 on 4/12/25.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
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

extension LoginViewController_Closure {
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.modalPresentationStyle = .formSheet
    //        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }

    
    // 함수를 미리 정의를 해서 던진다 그럼 실행은 어디서 할까? 받은 쪽에서 한다
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure() // 함수를 받을롬
        welcomeViewController.id = idTextField.text
        
        // 1. 함수를 미리 정의 => 던짐
        welcomeViewController.loginDataCompletion = { [weak self] data in
            print("클로저로 받아온 id가 뭐냐면", data)
            guard let self else { return }
            self.passwordTextField.text = data
        } // 여기 까지 함수 정의
    
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}


#Preview{
    LoginViewController_Closure()
}
