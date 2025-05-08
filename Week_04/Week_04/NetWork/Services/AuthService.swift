//
//  AuthService.swift
//  Week_04
//
//  Created by 정정욱 on 5/6/25.
//

import Foundation

final class AuthService {
    static let shared = AuthService()
    
    func signup(
        loginId: String,
        password: String,
        nickName: String
    ) async throws -> RegisterUserInfo {
        
        // 1. Request body 모델 생성 및 인코딩
        let requestModel = RegisterRequest(
            loginId: loginId,
            password: password,
            nickname: nickName
        )
        let encodedBody = try JSONEncoder().encode(requestModel)
        
        // 2. APIService 통해 요청
        return try await APIService.shared.request(
            path: Endpoint.Auth.signup.path,
            method: Endpoint.Auth.signup.method,
            body: encodedBody,
            responseType: RegisterResponse.self
        ).data // 라서 반환 타입이 RegisterResponseBody임
    }
    
    func signin(
        loginId: String,
        password: String
    ) async throws -> LoginUserID {
        
        let requestModel = LoginRequest(
            loginId: loginId,
            password: password
        )
        let encodedBody = try JSONEncoder().encode(requestModel)
        
        return try await APIService.shared.request(
            path: Endpoint.Auth.signin.path,
            method: Endpoint.Auth.signin.method,
            body: encodedBody,
            responseType: LoginResponse.self
        ).data
    }
}
