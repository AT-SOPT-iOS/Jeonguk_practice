//
//  NicknameLis.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

struct NicknameListResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameList
}

struct NicknameList: Codable {
    let nicknameList: [String]
}
