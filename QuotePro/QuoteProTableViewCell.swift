//
//  QuoteProTableViewCell.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteProTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func configureQuoteProCell(with quotePro: QuotePro) {
        
        photoImageView.image = quotePro.photo?.photo
        quoteLabel.text = quotePro.quote?.quote
        authorLabel.text = quotePro.quote?.author
    }
    
}
