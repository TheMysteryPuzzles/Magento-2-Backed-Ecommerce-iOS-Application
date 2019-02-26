//
//  Ex_ImageView.swift
//  MagentoAPI
//
//  Created by Work on 2/1/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
 
    
    func downloadAndSetImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { 
        contentMode = mode
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    self.image = image
                }
                }.resume()
        }
   
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadAndSetImage(from: url, contentMode: mode)
    }
    
    func loadImageUsingCache(withUrl url: URL){
        
        self.image = nil
        
        // RETREVING FROM CACHE
        if let cacheImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
            
            self.image = cacheImage
            return
        }
        
        // GOING ON NETWORK AND STROING IN CACHE
     
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: url as AnyObject)
                    imageCache.evictsObjectsWithDiscardedContent = false
                    self.image = downloadedImage
                }
            }
            }.resume()
    }
    
}
