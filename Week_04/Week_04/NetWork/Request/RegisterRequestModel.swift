//
//  RegisterRequestBody.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

struct RegisterRequest: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
