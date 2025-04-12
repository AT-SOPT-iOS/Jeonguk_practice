//
//  WelcomeViewController_DelegatePattern.swift
//  Week_02
//
//  Created by 정정욱 on 4/12/25.
//

import UIKit

// 프로토콜 : 자격증(이 자격증을 가진애들은 다 올 수 있음) - 의존성 주입이라는 개념

protocol DataBindDelegate : AnyObject {
    func dataBind(id : String) // 위임할 일을 정의
}

class WelcomeViewController_DelegatePattern: UIViewController {
    
    // MARK: - Property
    
    var id: String?
    weak var delegate : DataBindDelegate? // 프로토콜 타입 채택한 애들은 다 올수가 있어
    
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
        //id = ""
    }
    
    // MARK: - Setting
    
    private func addViews() {
        view.addSubviews(mainImage, welcomeLabel, backButton, reLoginButton)
    }
}

//MARK: Action

extension WelcomeViewController_DelegatePattern{
    
    @objc
    private func backToLoginButtonDidTap() {
        
        if let id = id {
            delegate?.dataBind(id: id)
        }
        
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
    WelcomeViewController_DelegatePattern()
}
