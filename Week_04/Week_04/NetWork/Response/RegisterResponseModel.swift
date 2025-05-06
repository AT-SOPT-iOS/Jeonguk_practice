//
//  RegisterResponseBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody // 응답 데이터 (userId, nickname 등 포함)
}

struct RegisterResponseBody: Codable {
    let userId: Int
    let nickname: String
}
