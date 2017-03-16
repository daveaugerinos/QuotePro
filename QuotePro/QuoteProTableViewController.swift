//
//  QuoteProTableViewController.swift
//  QuotePro
//
//  Created by Dave Augerinos on 2017-03-15.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class QuoteProTableViewController: UITableViewController, SaveQuoteProProtocol {

    var quotesArray = [QuotePro]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return quotesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set Identifier
        let cellIdentifier = "quoteProCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuoteProTableViewCell else {
            fatalError("The dequeued cell is not an instance of QuoteProTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let quotePro = quotesArray[indexPath.row]
        
        // Configure the cell
        cell.configureQuoteProCell(with: quotePro)

        return cell
    }



    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            quotesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // image to share
        if( quotesArray.count > 0) {
            
            let quotePro = quotesArray[indexPath.row]
            quotePro.quote?.quote = ""
            quotePro.quote?.author = ""
            
        
            
            let quoteView = QuoteView()
            //quoteView.backgroundColor = UIColor.red
            
            quoteView.setupWithQuote(quotePro: quotePro)
            quoteView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(quoteView)
            
            quoteView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            quoteView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
            quoteView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: 0).isActive = true
            quoteView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5, constant: 0).isActive = true
            
            
            guard let image = quotePro.photo?.photo else {
                return
            }
            
            let imageToShare = [ image ]
            
            // set up activity view controller
            let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivityType.airDrop ]
            
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
            
            activityViewController.completionWithItemsHandler =
                {(activity, completed, returnObjects, error) in
                    
                    quoteView.removeFromSuperview()
            }
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        super.prepare(for: segue, sender: sender)
        
        if(segue.identifier == "quoteBuilderVC") {
            
            guard let quoteBuilderVC = segue.destination as? QuoteBuilderViewController else {
                
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            quoteBuilderVC.delegate = self
        }
        
        else {
            
            fatalError("Unexpected Segue Identifier: \(segue.identifier)")
        }
    }

    
    // MARK: - Private Methods
    
    func saveQuoteProWithSnapshot(quotePro: QuotePro) {
        
        // Add a new quote
        let newIndexPath = IndexPath(row: quotesArray.count, section: 0)
        
        quotesArray.append(quotePro)

        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
