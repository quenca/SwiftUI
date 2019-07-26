//
//  MovieRow.swift
//  MovieSwiftUI
//
//  Created by Gustavo Pereira Teixeira Quenca on 26/07/19.
//  Copyright © 2019 Gustavo Pereira Teixeira Quenca. All rights reserved.
//

import SwiftUI

struct MovieRow : View {
    var movie: Movie
    
    var body: some View {
        MovieItem(movie: movie)
    }
}

struct MovieItem: View {
    var movie: Movie
    
    var body: some View {
        
          VStack(alignment: .leading) {
            
            NavigationLink(destination: MovieDetail(movie: movie)) {
            URLImageTest(url: "https://image.tmdb.org/t/p/w200\(self.movie.poster_path!)")
                //.cornerRadius(20)
            }
            
            if movie.isFavorite {
            Image(systemName: "star.fill")
                .imageScale(.medium)
                            .foregroundColor(.yellow)
                    }
            
            
                Text(movie.title!)
                    .font(.caption)
                    .bold()
                    .lineLimit(2)
                    .padding()
            
    
            }
            .padding(.leading, 15)
    }
}
