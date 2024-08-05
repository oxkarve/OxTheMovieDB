//
//  UIImageView+Extensions.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageFromUrl(urlImage: String, defaultImage: UIImage) {
        
        if self.image == nil {
            self.image = defaultImage
        }
        
        guard
            let imageUrlServer = Environment.getEnvironmentVariable(name: .imageUrl) else {
            return
        }
        
        let imageURLString = imageUrlServer + urlImage
        let task = URLSession.shared.dataTask(with: URL(string: imageURLString)!) {data , response ,error in
            
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else {return}
                let image = UIImage(data: data)
                self.image = image
            }
        }
        
        task.resume()
    }
}
