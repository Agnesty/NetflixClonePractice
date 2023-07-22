//
//  APICaller.swift
//  NetflixClonePractice
//
//  Created by Agnes Triselia Yudia on 22/07/23.
//

import Foundation

class Constant {
    static let API_KEY = "5a6c62ab2e7f86d4dafe22caaa418b98"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.API_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //MARK: Untuk Mengechek API berhasil di get atau belum dengan mengeprintnya
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //print(results)
                
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                //print(results.results[0].original_title)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
            
        }

        task.resume()
    }
    
}
