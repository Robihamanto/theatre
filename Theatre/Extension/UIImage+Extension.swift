//
//  UIImage+Extension.swift
//  Theatre
//
//  Created by Robihamanto on 17/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxCocoa

extension UIImageView {
    func loadImage(fromUrl url: String) {
        DispatchQueue.global().async {
            // Create url from string address
            guard let url = URL(string: url) else {
                return
            }
            
            // Create data from url (You can handle exeption with try-catch)
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            // Create image from data
            guard let image = UIImage(data: data) else {
                return
            }
            
            // Perform on UI thread
            DispatchQueue.main.async {
                self.image = image
                //self.hideSkeleton()
            }
        }
    }
}
