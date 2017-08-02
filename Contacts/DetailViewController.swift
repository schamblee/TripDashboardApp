//
//  DetailViewController.swift
//  Contacts
//
//  Created by stephanie Chamblee on 7/17/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UITabBarControllerDelegate {
    
    @IBOutlet var nameLabel: UILabel!

    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self

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
    

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 3 {
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                self.performSegue(withIdentifier: "cancelLogout", sender: self)
            })
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                print("OK")
            })
            
            self.present(alert, animated: true)
        }
    }

}

@IBDesignable public class RoundedImageView: UIImageView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
    }
    

}
