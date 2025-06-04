//
//  RegisterResponseBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

struct RegisterResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterUserInfo
}

struct RegisterUserInfo: Codable {
    let userId: Int
    let nickname: String
}
