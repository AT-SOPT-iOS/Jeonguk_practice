//
//  GetInfoService.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

class GetInfoService {
    
    static let shared = GetInfoService() // 싱글톤 인스턴스
    private init() {} // 외부에서 인스턴스 생성 방지
    
    // MARK: URLRequest 생성 함수 - URL, 메서드, 헤더, 바디
    func makeRequest(keyword: String?) -> URLRequest? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // optional
        return request
    }
    
    // MARK: 회원가입 요청 함수 - 서버 통신
    // 비동기적으로 실행 (즉, 이 함수는 잠시 멈췄다가 나중에 결과를 반환할 수 있는 함수)
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(NicknameListResponse.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}

