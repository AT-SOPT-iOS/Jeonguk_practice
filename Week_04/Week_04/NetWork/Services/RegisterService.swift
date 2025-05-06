//
//  RegisterService.swift
//  Week_04
//
//  Created by 정정욱 on 5/3/25.
//

import Foundation

// MARK: - RegisterService (Singleton 패턴)
class RegisterService {
    
    static let shared = RegisterService() // 싱글톤 인스턴스
    private init() {} // 외부에서 인스턴스 생성 방지
    
    //MARK: 회원가입 요청 바디 생성 함수 - JSON 데이터 생성
    // URL Session에 넣어줄 URL Request를 만드는 부분
    // 회원가입은 requestBody가 필요함. 이를 위해서 유저네임, 비번, 닉네임을 받아서 request 형식의 데이터 모델로 인코딩을 해주는 과정
    func makeRequestBody(loginId: String, password: String, nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(
                loginId: loginId,
                password: password,
                nickname: nickName
            )
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print("💥 Encoding error: \(error)")
            return nil
        }
    }
    
    // MARK: URLRequest 생성 함수 - URL, 메서드, 헤더, 바디
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "http://api.atsopt-seminar4.site/api/v1/auth/signup")! // String 형식이었던 URL을 URL객체로 만들어주고
        var request = URLRequest(url: url) // 해당 URL을 이용해서 URL Request 객체를 만들어 줍니다!
        request.httpMethod = "POST" // 이후, 어떤 HTTP Method를 사용할건지,
        let header = ["Content-Type": "application/json"] // 어떤 헤더를 사용할 것인지에 대해 코드 작성
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        // dictionary를 사용해서, 헤더를 선언하고, key와 value값을 통해 Request와 헤더를 설정해줌
        if let body = body {
            request.httpBody = body
        }
        // 이후에 아까 받아온 Body를 넣어줌
        
        return request
    }
    
    // MARK: 회원가입 요청 함수 - 서버 통신
    func PostRegisterData(loginId: String, password: String, nickName: String) async throws -> RegisterResponseBody {
        
        // makeRequestBody 함수를 이용해서, 리퀘스트 바디를 만들어줍니다! 실패할 경우, 아까 NetworkError에서 선언한 오류들을 던지게 됩니다
        guard let body = makeRequestBody(
            loginId: loginId,
            password: password,
            nickName: nickName
        ) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = self.makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        dump(request)
        
        // 응답 유효성 검사
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump(response)
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        // 문제 없으면 디코딩 수행
        do {
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decoded.data // 결국 정상 반환시 리턴 값
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}

