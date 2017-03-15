//
//  QuotePro.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuotePro: NSObject {

    var quote: Quote?
    var photo: Photo?
    
    init(with quote: Quote, photo: Photo) {
        
        self.quote = quote
        self.photo = photo
        super.init()
    }
    
}
