//
//  LoginRequestBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/8/25.
//

import Foundation

struct LoginRequestBody: Codable {
    let loginId: String
    let password: String
}
