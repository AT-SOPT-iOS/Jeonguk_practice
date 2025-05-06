//
//  NicknameLis.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

// 닉네임 리스트 응답 모델
struct NicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: nicknameList
}

// 개별 닉네임 항목
struct nicknameList: Codable {
    let nicknameList: [String]
}
