//
//  ScrollViewController.swift
//  Week_02
//
//  Created by 정정욱 on 4/12/25.
//

import UIKit

class ScrollViewController: UIViewController  {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let greenView = UIView()
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }

    private func setLayout() {
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(greenView)
        contentView.addSubview(blueView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: contentView.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 800)
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: 800),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
