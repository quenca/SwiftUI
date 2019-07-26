//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Gustavo Pereira Teixeira Quenca on 26/07/19.
//  Copyright © 2019 Gustavo Pereira Teixeira Quenca. All rights reserved.
//

import SwiftUI

struct MovieList : View {
    @State var model = MovieListModel()
    @EnvironmentObject var data: MovieListModel
    
    var body: some View {
        TabbedView {
        NavigationView{
            List {
                ScrollView {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(model.movies) { movie in
                            MovieRow(movie: movie)
                        }
                    }
                    }
                    .frame(height: 380)
                }
                .navigationBarTitle(Text("Movie"))
            } .tag(0)
                .tabItemLabel(Text("Movie"))
            NavigationView{
                List {
                    ForEach(data.movies) { movie in
                        if movie.isFavorite {
                            MovieRow(movie: movie)
                                .frame(height: 380)
                        }
                    }
                }
            } .tag(1)
                .tabItemLabel(Text("Favorites"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
