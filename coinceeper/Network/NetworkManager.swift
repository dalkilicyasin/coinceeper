//
//  NetworkManager.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 7.12.2024.
//

import Foundation
import Alamofire

class NetworkManager: NetworkService {
    private let config: NetworkConfigurable
    
    init(config: NetworkConfigurable) {
        self.config = config
    }
    
    
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type, method: Alamofire.HTTPMethod, completion: @escaping (Result<T, AFError>) -> Void){
        
        guard var urlRequest = self.urlRequest(with: endpoint) else {
            completion(.failure(.invalidURL(url: URL(string: "\(endpoint.path)")!)))
            return
        }
        
        urlRequest.httpMethod = method.rawValue
        
        do {
            if let bodyParams = endpoint.bodyParameters {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams)
            }else {
                urlRequest.httpBody = nil
            }
        } catch {
            print("JSON Serialization Error: \(error.localizedDescription)")
            let afError = AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            completion(.failure(afError))
            return
        }
        
        
    }
    
    private func urlRequest(with endpoint: Endpoint) -> URLRequest? {
        var urlComponents = URLComponents(string: self.config.baseURL.absoluteString)
        urlComponents?.path = "\(endpoint.path)"
        
        if let queryParameters = endpoint.queryParameters {
            urlComponents?.setQueryItems(with: queryParameters)
        }
        
        guard let url = urlComponents?.url else { return nil }
        
        var request = URLRequest(url: url)
        
        if let headers = endpoint.headerParameters {
            request.allHTTPHeaderFields = headers
        }
        
        return request
        
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping (Result<T, AFError>) -> Void ){
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            print(String(data: data, encoding: .utf8) ?? "Data is nil or invalid")
            completion(.success(result))
        } catch let decodingError as DecodingError {
            // Hatanın detaylarını inceleyelim
            switch decodingError {
            case .keyNotFound(let key, let context):
                print("Key '\(key)' not found:", context.debugDescription)
            case .typeMismatch(let type, let context):
                print("Type '\(type)' mismatch:", context.debugDescription)
            case .valueNotFound(let type, let context):
                print("Value '\(type)' not found:", context.debugDescription)
            case .dataCorrupted(let context):
                print("Data corrupted:", context.debugDescription)
            @unknown default:
                print("Unknown decoding error")
            }
            let afError = AFError.responseSerializationFailed(reason: .decodingFailed(error: decodingError))
            completion(.failure(afError))
        } catch {
            // Genel hata yönetimi
            print("Unexpected error: \(error)")
            let afError = AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
            completion(.failure(afError))
        }
    }
}


