//
//  MovieDetail.swift
//  MovieSwiftUI
//
//  Created by Gustavo Pereira Teixeira Quenca on 26/07/19.
//  Copyright © 2019 Gustavo Pereira Teixeira Quenca. All rights reserved.
//

import SwiftUI

struct MovieDetail : View {
    var movie: Movie
    @EnvironmentObject var model: MovieListModel
    
    
    var movieIndex: Int {
        model.movies.firstIndex(where:{ $0.id == movie.id })!
    }
    
    var body: some View {
        NavigationView {

            VStack(alignment: .leading) {
             
                URLImageTest(url: "https://image.tmdb.org/t/p/w200\(self.movie.poster_path!)")
                .cornerRadius(20)
                    .onAppear{
                        print("Profile appeared")
                    }.onDisappear{
                        print("Profile disappeared")
                }
                
                Button(action: {
                    self.model.movies[self.movieIndex].isFavorite.toggle()
                }) {
                    if self.model.movies[self.movieIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
            
                Text(movie.overview!)
                .bold()
                .lineLimit(10)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -50, trailing: 0))
            
                
            } .position(CGPoint(x: 200, y: 100))
            } .navigationBarTitle(Text(movie.title!))
    }
}

