//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    @IBOutlet weak var quoteView: QuoteView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Quote Builder"
        self.quoteView.photoImageView.image = UIImage(named: "defaultPhoto")
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Action Methods -
    
    @IBAction func randomQuoteTapped(_ sender: UIButton) {
    
        let quote = Quote()
        quote.downloadRandomQuoteAndAuthor(completionHandler: { isSuccessful -> Void in
         
            if isSuccessful {
                                   
                    self.quoteView.quoteLabel.text = quote.quote
                    self.quoteView.quoteLabel.textColor = UIColor.yellow
                    self.quoteView.quoteLabel.shadowColor = UIColor.lightGray
                    self.quoteView.authorLabel.text = quote.author
                    self.quoteView.authorLabel.textColor = UIColor.yellow
                    self.quoteView.authorLabel.shadowColor = UIColor.lightGray
            }
        })
 
    }
    
    @IBAction func randomPhotoTapped(_ sender: UIButton) {
    
        let photo = Photo()
        photo.downloadRandomPhoto(completionHandler: { isSuccessful -> Void in
            
            if isSuccessful {
                
                    self.quoteView.photoImageView.image = photo.photo
            }
        })
    }
    
    @IBAction func saveAsQuote(_ sender: UIButton) {
    
        print("saveAsQuote")
    }
}
