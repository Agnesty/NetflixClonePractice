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
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.API_KEY)") else {
            return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //MARK: Untuk Mengechek API berhasil di get atau belum dengan mengeprintnya
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //print(results)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                //print(results.results[0].original_title)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
            
            
        }

        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //print(results)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                print(results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
}
