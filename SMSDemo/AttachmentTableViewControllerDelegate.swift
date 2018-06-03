//
//  AttachmentDelegate.swift
//  SMSDemo
//
//  Created by M78 on 6/2/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import MessageUI

extension AttachmentTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filename = filenames[indexPath.row]
        sendSMS(attachment: filename)
    }
    
    func sendSMS(attachment: String) {
        guard MFMessageComposeViewController.canSendText() else {
            let alertMessage = UIAlertController(title: "SMS Unavailable", message: "This device cannot send a SMS.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK???", style: .default, handler: nil))
            
            present(alertMessage, animated: true, completion: nil)
            return
        }
        
        // SMS Filling
        let new = attachment.replacingOccurrences(of: " ", with: "%20")
        print("😡😡😡😡😡😡\(new)😡😡😡😡😡😡😡😡😡😡😡😡")
        
        if let messageUrl = URL(string: "sms:18811603673&body=\(new)") {
            UIApplication.shared.open(messageUrl, options: [:], completionHandler: nil)
        }
    }
    
}
