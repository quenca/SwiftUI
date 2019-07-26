//
//  DataSource.swift
//  MovieSwiftUI
//
//  Created by Gustavo Pereira Teixeira Quenca on 26/07/19.
//  Copyright © 2019 Gustavo Pereira Teixeira Quenca. All rights reserved.
//

import SwiftUI

class DataSource {
    private var dataTask: URLSessionDataTask? = nil
    
    func getURL () -> URL {
        let urlString = "https://api.themoviedb.org/3/movie/popular?page=1&language=en-US&api_key=2d6a9f31d31c88c43c84abe5cda527cc"
        let url = URL(string: urlString)
        return url!
    }
    
    func parse(data: Data) -> [Movie]? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(MovieListResult.self, from: data)
            return result.results
        } catch {
            return []
        }
    }
    
    func getRequest(completion: @escaping ([Movie]) -> ()) {
        let url = getURL()
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, _, _ in
            let parseMovie = self.parse(data: data!)
            DispatchQueue.main.async {
                completion(parseMovie!)
            }
        }.resume()
    }
}

