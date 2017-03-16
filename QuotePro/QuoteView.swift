//
//  QuoteView.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    // Custom view from the XIB file
    var view: UIView!
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func setupWithQuote(quotePro: QuotePro) {
        
        photoImageView.image = quotePro.photo?.photo
        quoteLabel.text = quotePro.quote?.quote
        authorLabel.text = quotePro.quote?.author
    }

    func xibSetup() {
        
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of view
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "QuoteView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        print(view)
        
        return view
    }
}
