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
                
        Alamofire.request("http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en").responseJSON { response in
            
            if let dict = response.result.value as? [String : AnyObject] {
                
                DispatchQueue.main.async {
                    
                    self.quote = dict["quoteText"] as? String
                    self.author = dict["quoteAuthor"] as? String
                    completionHandler(true)
                }
            }
        }
    }
}
