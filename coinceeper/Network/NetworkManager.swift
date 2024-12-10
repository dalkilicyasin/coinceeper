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
    
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type, method: HTTPMethod, completion: @escaping (Result<T, NetworkError>) -> Void){
        
        
        guard var urlRequest = self.urlRequest(with: endpoint) else {
            completion(.failure(.missingURL))
            return
        }
        
        urlRequest.httpMethod = method.rawValue
      //  var request = urlRequest
        
     //   request.httpMethod = method.rawValue
        
        do {
            if let bodyParams = endpoint.bodyParameters {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams)
            }else {
                urlRequest.httpBody = nil
            }
        } catch {
            print("JSON Serilaztion failed \(error.localizedDescription)")
            completion(.failure(.nonFatal(error: error)))
            return
        }
       
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Handle network error
            if let error = error {
                completion(.failure(.nonFatal(error: error)))
                return
            }
            
            // Handle HTTP response status code
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
                completion(.failure(.httpError(statusCode: httpResponse.statusCode)))
                if let data = data, let errorMessage = String(data: data, encoding: .utf8) {
                       print("Error message from server: \(errorMessage)")
                   }
                return
            }
            
            // Handle successful response with data
            if let data = data {
                if data.isEmpty {
                    print("Empty data with successful status code")
                    completion(.success(AnyCodable() as! T))
                } else {
                    self.handleResponse(data: data, completion: completion)
                }
            } else {
                print("No data received at all")
                completion(.failure(.decodeFault))
            }
        }.resume()
        
      
    }
    
    // Create URLRequest from endpoint
    private func urlRequest(with endpoint: Endpoint) -> URLRequest? {
        var urlComponents = URLComponents(string: config.baseURL.absoluteString)
        urlComponents?.path = "/\(endpoint.path)"
        
        // Add query parameters if any
        if let queryParams = endpoint.queryParameters {
            urlComponents?.setQueryItems(with: queryParams)
        }
        
        
        guard let url = urlComponents?.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        
        // Add headers if provided
        if let headers = endpoint.headerParameters {
            request.allHTTPHeaderFields = headers
        }
        
        return request
    }
    
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping(Result<T, NetworkError>) -> ()) {
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
                completion(.failure(.decodeFault))  // Hata bilgisini kaybetmeden iletin
            } catch {
                // Genel hata yönetimi
                print("Unexpected error: \(error)")
                completion(.failure(.decodeFault))
            }
    }
}


