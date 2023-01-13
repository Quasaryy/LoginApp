//
//  DashboardViewController.swift
//  LoginApp
//
//  Created by Yury on 13.01.23.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: Preparing var to send username value from FirstVC to current VC
    var user: Users!
    
    @IBOutlet var userNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text! += user.login + "!"
    }

}
