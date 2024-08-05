//
//  RequestManager.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation

class RequestManager {
    
    func getTopRatedMovies(page: Int , _ completionHandler: @escaping (MovieList) -> Void){
        
        guard
            let apiLanguage = Environment.getEnvironmentVariable(name: .apiLanguage),
            let apiURL = Environment.getEnvironmentVariable(name: .apiUrl),
            let apiKey = Environment.getEnvironmentVariable(name: .apiKey) else {
            return
        }
        
        if let apiRequestURL = URL(string: apiURL){
            var components = URLComponents(url: apiRequestURL, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: apiLanguage),
                URLQueryItem(name: "page", value: String(page)),
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = [
                "accept": "application/json"
            ]
            
            let dataTask = URLSession.shared.dataTask(with: request){ data, request, error in
                if let error = error {
                    print("Error on fetching top rated movies: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(MovieList.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error on decoding top rated movie list \(error)")
                    return
                }
            }
            
            dataTask.resume()
            
        }
    }
    
    func getMovieDetali(movieId: String , _ completionHandler: @escaping (Movie) -> Void){
        
        guard
            let apiLanguage = Environment.getEnvironmentVariable(name: .apiLanguage),
            let apiKey = Environment.getEnvironmentVariable(name: .apiKey),
            let apiURLDetailMovie = Environment.getEnvironmentVariable(name: .apiUrlDetailMovie)
        else {
            return
        }
        
        if let apiRequestURL = URL(string: "\(apiURLDetailMovie)/\(movieId)"){
            var components = URLComponents(url: apiRequestURL, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: apiLanguage)
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = [
                "accept": "application/json"
            ]
            
            let dataTask = URLSession.shared.dataTask(with: request){ data, request, error in
                if let error = error {
                    print("Error on fetching movie detail: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(Movie.self, from: data)
                    completionHandler(response)
                } catch {
                    print("Error on decoding movie detail \(error)")
                    return
                }
            }
            
            dataTask.resume()
            
        }
    }
}
