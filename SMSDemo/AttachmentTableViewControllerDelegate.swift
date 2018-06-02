//
//  AttachmentDelegate.swift
//  SMSDemo
//
//  Created by M78 on 6/2/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

extension AttachmentTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filename = filenames[indexPath.row]
        sendSMS(attachment: filename)
    }
    
    func sendSMS(attachment: String) {
        
    }
    
}
