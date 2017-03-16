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
        
        Alamofire.request("https://httpbin.org/image/png").responseImage { response in
            debugPrint(response)
            
            print(response.request!)
            print(response.response!)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                
                DispatchQueue.main.async {
                    
                    self.photo = image
                    completionHandler(true)
                }
            }
        }
    }
}
