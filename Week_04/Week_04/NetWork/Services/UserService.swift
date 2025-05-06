//
//  UserService.swift
//  Week_04
//
//  Created by 정정욱 on 5/6/25.
//

import Foundation

final class UserService {
    static let shared = UserService()
    
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        return try await APIService.shared.request(
            path: Endpoint.User.all(keyword: keyword).path,
            method: Endpoint.User.all(keyword: keyword).method,
            responseType: NicknameListResponseWrapper.self
        ).data.nicknameList
    }
}
