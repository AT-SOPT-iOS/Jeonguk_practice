//
//  AutoLayoutViewController.swift
//  Week_02
//
//  Created by 정정욱 on 4/12/25.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    
    let yellowBox = UIView()
    let greenBox = UIView()
    let blackBox = UIView()
    let blueBox = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // blueBox 올려둔 순서대로 가서 blueBox값 오토레이아웃 지정 안하면 yellowBox 자리에 blueBox가 보이게됨
        [yellowBox, greenBox, blackBox, blueBox].forEach { box in
            box.translatesAutoresizingMaskIntoConstraints = false // 이걸 사용하면
            /*
             let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,
                                                                               height: 20))) 및에서 선언산 프레임 값이 무시되어서
             yellowBox.widthAnchor.constraint(equalToConstant: boxWidth),
             yellowBox.heightAnchor.constraint(equalToConstant: boxHeight) 이렇게 다시 지정해줘야함
             */
            self.view.addSubview(box)
        }
        
        yellowBox.backgroundColor = .yellow
        greenBox.backgroundColor = .green
        blackBox.backgroundColor = .black
        blueBox.backgroundColor = .blue
        
        let boxWidth = UIScreen.main.bounds.width / 2
        let boxHeight = UIScreen.main.bounds.height / 4
        
        NSLayoutConstraint.activate([
            // yellowBox
            
            // view.safeAreaLayoutGuide.topAnchor 이렇게 하면 safeArea영역을 살리겠다는 이야기임
            yellowBox.topAnchor.constraint(equalTo: view.topAnchor),
            yellowBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowBox.widthAnchor.constraint(equalToConstant: boxWidth),
            yellowBox.heightAnchor.constraint(equalToConstant: boxHeight),
            
            // greenBox
            greenBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
            greenBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenBox.widthAnchor.constraint(equalToConstant: boxWidth),
            greenBox.heightAnchor.constraint(equalToConstant: boxHeight),
            
            // blackBox
            blackBox.topAnchor.constraint(equalTo: greenBox.bottomAnchor),
            blackBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackBox.widthAnchor.constraint(equalToConstant: boxWidth),
            blackBox.heightAnchor.constraint(equalToConstant: boxHeight),
            
            // blueBox
            blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor),
            blueBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueBox.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueBox.widthAnchor.constraint(equalToConstant: boxWidth),
            blueBox.heightAnchor.constraint(equalToConstant: boxHeight),
        ])
    }
}

