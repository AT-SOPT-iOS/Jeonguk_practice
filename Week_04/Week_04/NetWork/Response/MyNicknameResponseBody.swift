//
//  MyNicknameResponseBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/8/25.
//

import Foundation

// MARK: - Welcome
struct MyNicknameResponseBody: Codable {
    let success: Bool
    let code, message: String
    let data: Nickname
}

// MARK: - DataClass
struct Nickname: Codable {
    let nickname: String
}
