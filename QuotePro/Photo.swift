//
//  Photo.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Photo: NSObject {

    var photo: UIImage?
    
    func downloadRandomPhoto(completionHandler: @escaping (Bool) -> Void) {
        
        Alamofire.request("http://lorempixel.com/400/200/").responseImage { response in
            
            if let image = response.result.value {
                
                DispatchQueue.main.async {
                    
                    self.photo = image
                    completionHandler(true)
                }
            }
        }
    }
}
