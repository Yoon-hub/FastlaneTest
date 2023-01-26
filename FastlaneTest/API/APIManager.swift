//
//  APIManager.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import Foundation

final class APIManager {
    
    private init() {}
    
    static let shared = APIManager()
    
    func requestAPI(completion: @escaping (Result<YsData, APIError>) -> Void ) {
        guard let url = URL(string: APIKey.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(.failedRequest))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.invalidRessponse))
                    return
                }
                
                guard response.statusCode == 200 else {
                    completion(.failure(.failedResponse))
                    return
                }
                
                do  {
                    let result = try JSONDecoder().decode(YsData.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.invalidData))
                }
            }
        }.resume()
        
        
        
    }
    
}
