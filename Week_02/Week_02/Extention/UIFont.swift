//
//  UIFont.swift
//  Week_1
//
//  Created by 정정욱 on 4/10/25.
//

import UIKit

extension UIFont {
    enum Pretendard {
        static func head1() -> UIFont {
            return UIFont(name: "Pretendard-Regular", size: 25)!
        }
        
        static func subhead1() -> UIFont {
            return UIFont(name: "Pretendard-Bold", size: 18)!
        }

        static func subhead2() -> UIFont {
            return UIFont(name: "Pretendard-SemiBold", size: 16)!
        }
        
        static func subhead3() -> UIFont {
            return UIFont(name: "Pretendard-SemiBold", size: 15)!
        }
        
        static func subhead4() -> UIFont {
            return UIFont(name: "Pretendard-SemiBold", size: 14)!
        }
        
        static func subhead5() -> UIFont {
            return UIFont(name: "Pretendard-SemiBold", size: 14)!
        }
    }
}
