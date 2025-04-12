//
//  UIView.swift
//  Week_1
//
//  Created by 정정욱 on 4/10/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
