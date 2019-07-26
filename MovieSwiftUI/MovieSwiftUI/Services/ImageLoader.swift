//
//  ImageLoader.swift
//  MovieSwiftUI
//
//  Created by Gustavo Pereira Teixeira Quenca on 26/07/19.
//  Copyright © 2019 Gustavo Pereira Teixeira Quenca. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: BindableObject {
    
    var downloadedImage: UIImage?
    let willChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.willChange.send(nil)
                }
                return
            }
            
            self.downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
            
            }.resume()
    }
}
