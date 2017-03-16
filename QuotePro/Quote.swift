//
//  Quote.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Quote: NSObject {

    var quote: String?
    var author: String?

    func downloadRandomQuoteAndAuthor(completionHandler: @escaping (Bool) -> Void) {
        
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request!)  // original URL request
            print(response.response!) // HTTP URL response
            print(response.data!)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                DispatchQueue.main.async {
                    
                    self.quote = "TESTING QUOTE"
                    self.author = "TESTING AUTHOR"
                    completionHandler(true)
                }
            }
        }
    }
}
