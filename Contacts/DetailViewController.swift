//
//  DetailViewController.swift
//  Contacts
//
//  Created by stephanie Chamblee on 7/17/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameLabel: UILabel!

    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contact = self.contact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
        }
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

}

@IBDesignable public class RoundedImageView: UIImageView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
