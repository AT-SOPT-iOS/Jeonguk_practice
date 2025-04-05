//
//  ViewController.swift
//  Week_1
//
//  Created by 정정욱 on 4/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var testView: UIView = UIView(frame: .init(origin: .init(x: 100, y: 100),
                                                       size: .init(width: 150, height: 150)))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        testView.backgroundColor = .red
        
        self.view.addSubview(testView) // View 위에 올리기 해당 뷰 기준으로 좌표를 가지게됨 frame
    }
    
}

