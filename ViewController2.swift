//
//  ViewController2.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 03/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//


import UIKit
import MessageUI

class ViewController2: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var emailOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailOutlet.layer.cornerRadius = 15
    }
    
    @IBAction func emailButton(_ sender: Any) {
        
       let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail()
         {
            self.present(mailComposeViewController, animated: true)
        
    }
        else
        
        {
            self.shoSendMailErrorAlert()
        }
}

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
         mailComposeVC.setToRecipients(["dimka.kot@gmail.com"])
        mailComposeVC.setSubject("Subject")
        mailComposeVC.setMessageBody("write your message here", isHTML: false)
        return mailComposeVC
        
    }
    func shoSendMailErrorAlert()
    {
        let alert = UIAlertController(title: "Could not sent mail", message: "Unable to send email. Please check your email...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            self.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.failed:
            self.shoSendMailErrorAlert()
            self.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.sent:
            self.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
