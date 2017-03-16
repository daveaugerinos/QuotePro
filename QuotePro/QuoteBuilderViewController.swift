//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    @IBOutlet private weak var quoteView: QuoteView!
    var delegate:SaveQuoteProProtocol?
    private var quote = Quote()
    private var photo = Photo()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Quote Builder"
        self.quoteView.photoImageView.image = UIImage(named: "defaultPhoto")
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Action Methods -
    
    @IBAction func randomQuoteTapped(_ sender: UIButton) {
    
        quote.downloadRandomQuoteAndAuthor(completionHandler: { isSuccessful -> Void in
         
            if isSuccessful {
                
                self.quoteView.quoteLabel.text = self.quote.quote
                self.quoteView.quoteLabel.textColor = UIColor.yellow
                self.quoteView.quoteLabel.shadowColor = UIColor.lightGray
                self.quoteView.authorLabel.text = self.quote.author
                self.quoteView.authorLabel.textColor = UIColor.yellow
                self.quoteView.authorLabel.shadowColor = UIColor.lightGray
            }
        })
    }
    
    @IBAction func randomPhotoTapped(_ sender: UIButton) {
        
        photo.downloadRandomPhoto(completionHandler: { isSuccessful -> Void in
            
            if isSuccessful {
                
                self.quoteView.photoImageView.image = self.photo.photo
            }
        })
    }
    
    @IBAction func saveAsQuote(_ sender: UIButton) {
        
        let image = snapshot(view: quoteView)
        photo.photo = image
        
        let quotePro = QuotePro(with: quote, photo: photo)
        
        delegate?.saveQuoteProWithSnapshot(quotePro: quotePro)
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            
            dismiss(animated: true, completion: nil)
        }
            
        else if let owningNavigationController = navigationController {
            
            owningNavigationController.popViewController(animated: true)
        }
            
        else {
            
            fatalError("The QuoteBuilderViewController is not inside a navigation controller.")
        }
    }
    
    
    // MARK: - Private Methods -
    
    private func snapshot(view: UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return image!
    }
}
