//
//  APIHandler.swift
//  Post_Reader_App
//
//  Created by Neosoft on 21/09/23.
//

import Foundation
enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}
class APIHandler {
    func fetch<T: Codable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}










//enum APIError: Error {
//    case invalidURL
//    case requestFailed(Error)
//    case invalidResponse
//    case decodeError(Error)
//}
//
//struct APIResponse<T> {
//    let data: T?
//    let error: APIError?
//}
//
//class APIHandler {
//    func fetch<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (T) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(APIResponse<Any>(data: nil, error: .requestFailed(error)) as! T)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                completion(APIResponse<Any>(data: nil, error: .invalidResponse) as! T)
//                return
//            }
//
//            guard let data = data else {
//                completion(APIResponse<Any>(data: nil, error: .invalidResponse) as! T)
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(APIResponse(data: decodedData, error: nil) as! T)
//            } catch {
//                completion(APIResponse<Any>(data: nil, error: .decodeError(error)) as! T)
//            }
//        }.resume()
//    }
//    
//    
//    
//    
//    
////    func fetch<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (APIResponse<T>) -> Void) {
////        URLSession.shared.dataTask(with: url) { data, response, error in
////            if let error = error {
////                completion(APIResponse(data: nil, error: .requestFailed(error)))
////                return
////            }
////
////            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
////                completion(APIResponse(data: nil, error: .invalidResponse))
////                return
////            }
////
////            guard let data = data else {
////                completion(APIResponse(data: nil, error: .invalidResponse))
////                return
////            }
////
////            do {
////                let decodedData = try JSONDecoder().decode(T.self, from: data)
////                completion(APIResponse(data: decodedData, error: nil))
////            } catch {
////                completion(APIResponse(data: nil, error: .decodeError(error)))
////            }
////        }.resume()
////    }
//
//}
//
//
