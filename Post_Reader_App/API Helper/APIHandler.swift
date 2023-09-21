//
//  APIHandler.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodeError(Error)
}

struct APIResponse<T> {
    let data: T?
    let error: APIError?
}

class APIHandler {
    
    func fetch<T: Decodable>(from url: URL, responseType: T.Type) async throws -> APIResponse<T> {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return APIResponse(data: nil, error: .invalidResponse)
            }

            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return APIResponse(data: decodedData, error: nil)
        } catch {
            return APIResponse(data: nil, error: .requestFailed(error))
        }
    }

    
//    func fetch<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (APIResponse<T>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(APIResponse(data: nil, error: .requestFailed(error)))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                completion(APIResponse(data: nil, error: .invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(APIResponse(data: nil, error: .invalidResponse))
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(APIResponse(data: decodedData, error: nil))
//            } catch {
//                completion(APIResponse(data: nil, error: .decodeError(error)))
//            }
//        }.resume()
//    }

}


