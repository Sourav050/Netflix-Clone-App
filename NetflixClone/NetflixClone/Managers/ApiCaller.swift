//
//  ApiCaller.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 02/02/24.
//

import Foundation


struct Constants {
    static let API_KEY = "79331a9dcdae8c10d8fc6be6e7d3b364"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class ApiCaller {
    static let shared = ApiCaller()
    
    
    func getTrendingMovies( completion : @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {  return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                let results =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data )
                //                print(results.results[0].original_title)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    
    func getTrendingTVs(completion : @escaping (Result<[Title], Error>) -> Void ){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results =  try JSONDecoder().decode(TrendingTitleResponse.self, from: data )
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    
    func getUpcomingMovies(completion : @escaping (Result<[Title], Error>) -> Void ) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self , from: data)
                
                completion(.success(results.results))
                //                print(results)
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    func getPopular(completion : @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder ().decode(TrendingTitleResponse.self, from : data)
                completion(.success(results.results))
            }catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    
    
    func getTopRated(completion : @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) {
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder ().decode(TrendingTitleResponse.self, from : data)
                completion(.success(results.results))
            }catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
     
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))

                } catch {
                    completion(.failure(APIError.failedTogetData))
                }

            }
            task.resume()
        }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
 
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

            } catch {
                completion(.failure(APIError.failedTogetData))
            }

        }
        task.resume()
    }
}

