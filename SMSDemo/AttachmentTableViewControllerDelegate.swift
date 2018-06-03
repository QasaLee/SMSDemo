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
        let messageController = MFMessageComposeViewController()
        messageController.messageComposeDelegate = self
        messageController.recipients = ["18811603673"]
        
        let fileParts = attachment.components(separatedBy: ".")
        let fileName = fileParts[0]
        let fileExtension = fileParts[1]
        let filePath = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        let fileUrl = URL(fileURLWithPath: filePath!)
        messageController.addAttachmentURL(fileUrl, withAlternateFilename: nil)
        
        messageController.body = "Just sent the \(attachment) to you, check this out!"
        present(messageController, animated: true, completion: nil)
    }
    
}
