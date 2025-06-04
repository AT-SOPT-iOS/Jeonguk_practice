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
            responseType: NicknameListResponse.self
        ).data.nicknameList
    }

    func fetchMyNickname() async throws -> String {

        guard let userIdString = KeychainManager.shared.load(key: "userId") else {
            throw NSError(domain: "KeychainError", code: -1, userInfo: [NSLocalizedDescriptionKey: "userId가 존재하지 않습니다."])
        }

        let headers = [
            "userId": userIdString
        ]

        return try await APIService.shared.request(
            path: Endpoint.User.me.path,
            method: Endpoint.User.me.method,
            headers: headers,
            responseType: MyNicknameResponse.self
        ).data.nickname
    }

    func UpdateMyNickname() async throws -> String {
        guard let userIdString = KeychainManager.shared.load(key: "userId") else {
            throw NSError(domain: "KeychainError", code: -1, userInfo: [NSLocalizedDescriptionKey: "userId가 존재하지 않습니다."])
        }

        let headers = [
            "userId": userIdString
        ]

        return try await APIService.shared.request(
            path: Endpoint.User.update.path,
            method: Endpoint.User.update.method,
            headers: headers,
            responseType: MyNicknameResponse.self
        ).data.nickname
    }
}
