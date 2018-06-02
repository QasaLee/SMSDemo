//
//  AttachmentTableViewController.swift
//  SMSDemo
//
//  Created by Simon Ng on 6/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import MessageUI

class AttachmentTableViewController: UITableViewController {

    let filenames = ["10 Great iPhone Tips.pdf", "camera-photo-tips.html", "foggy.jpg", "Hello World.ppt", "no more complaint.png", "Why Appcoda.doc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Enable large title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return filenames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = filenames[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon\(indexPath.row)");
        
        return cell
    }
    


}

extension AttachmentTableViewController: MFMailComposeViewControllerDelegate {
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        // Check the result or perform other tasks.
        switch result {
        case .cancelled:
            print("⛹️‍♂️⛹️‍♂️⛹️‍♂️Message Canceled!")
        case .failed:
            print("⛹️‍♂️⛹️‍♂️⛹️‍♂️Message-sending Failed!")
        case .sent:
            print("⛹️‍♂️⛹️‍♂️⛹️‍♂️Message Sent!")
        
        }
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)}
}


