//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Quote Builder"
        
        // Load custom view
        
        
        

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
    
        print("randomQuoteTapped")
    }
    
    @IBAction func randomPhotoTapped(_ sender: UIButton) {
    
        print("randomPhotoTapped")
    }
    
    @IBAction func saveAsQuote(_ sender: UIButton) {
    
        print("saveAsQuote")
    }
}