//
//  Endpoint.swift
//  Week_04
//
//  Created by 정정욱 on 5/6/25.
//

import Foundation

enum Endpoint {

    enum Auth {
        case signup
        case signin

        var path: String {
            switch self {
            case .signup: return "/api/v1/auth/signup"
            case .signin: return "/api/v1/auth/signin"
            }
        }

        var method: HTTPMethod {
            switch self {
            case .signup, .signin: return .POST
            }
        }
    }

    enum User {
        case me
        case all(keyword: String?)
        case update

        var path: String {
            switch self {
            case .me: return "/api/v1/users/me"
            case .all(let keyword):
                if let keyword = keyword, !keyword.isEmpty {
                    // 인코딩시 한글 깨짐 방지
                    return "/api/v1/users?keyword=\(keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                } else {
                    return "/api/v1/users"
                }
            case .update: return "/api/v1/users"
            }
        }

        var method: HTTPMethod {
            switch self {
            case .me, .all: return .GET
            case .update: return .PATCH
            }
        }
    }
}
