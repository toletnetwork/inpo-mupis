//
//  IMMoviePosterImageView.swift
//  InpoMupis
//
//  Created by Dedi Prakasa on 4/21/20.
//  Copyright © 2020 Dedi Prakasa. All rights reserved.
//

import UIKit

class IMMoviePosterImageView: UIImageView {
    
    let placeholderImage = UIImage(systemName: "film")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = placeholderImage
        layer.cornerRadius = 10
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(from urlString: String) {
        let endpoint = "https://image.tmdb.org/t/p/w500\(urlString)"
        
        guard let url = URL(string: endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print("------------------X")
                return
            }
            
            guard (response as? HTTPURLResponse) != nil else {
                print("------------------Y")
                return
            }
            
            guard let data = data else {
                print("------------------Z")
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("------------------A")
                return
            }
            
            DispatchQueue.main.sync {
                print(image)
                self.image = image
            }
        }
        
        task.resume()
    }
    
    
}