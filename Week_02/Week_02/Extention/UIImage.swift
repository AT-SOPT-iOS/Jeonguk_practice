//
//  UIImage.swift
//  Week_1
//
//  Created by 정정욱 on 4/10/25.
//

import UIKit

enum ImageLiterals {

    // MARK: - WelcomeViewController
    static var person: UIImage { .load(name: "Person") }
    static var mainLogo: UIImage { .load(name: "MainLogo") }
    static var login: UIImage { .load(name: "Login") }

    // MARK: - Product Images
    static var product1: UIImage { .load(name: "Product1") }
    static var product2: UIImage { .load(name: "Product2") }
    static var product3: UIImage { .load(name: "Product3") }
    static var product4: UIImage { .load(name: "Product4") }
    static var product5: UIImage { .load(name: "Product5") }

    // MARK: - Icons (from Icon asset group)
    static var icAlarm: UIImage { .load(name: "Icon/ic_alarm") }
    static var icChat: UIImage { .load(name: "Icon/ic_chat") }
    static var icDownArrow: UIImage { .load(name: "Icon/ic_down_arrow") }
    static var icHeart: UIImage { .load(name: "Icon/ic_heart") }
    static var icRedHeart: UIImage { .load(name: "Icon/ic_red_heart") }
    static var icMenu: UIImage { .load(name: "Icon/ic_menu") }
    static var icScanDash: UIImage { .load(name: "Icon/ic_scan_dash") }
    static var icSearch: UIImage { .load(name: "Icon/ic_search") }
}


extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
