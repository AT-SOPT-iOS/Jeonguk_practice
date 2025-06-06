//
//  LoginResponseBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/8/25.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let code, message: String
    let data: LoginUserID
}

struct LoginUserID: Codable {
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
    }
}
