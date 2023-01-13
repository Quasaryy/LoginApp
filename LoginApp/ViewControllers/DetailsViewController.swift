//
//  DetailsViewController.swift
//  LoginApp
//
//  Created by Yury on 13.01.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: Preparing var to send fullName value from FirstVC to current VC
    var user: Users!

    @IBOutlet var fullNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = user.person.fullName
    }

}
