//
//  APIService.swift
//  Week_04
//
//  Created by 정정욱 on 5/6/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}

    private let baseURL = "http://api.atsopt-seminar4.site"

    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
