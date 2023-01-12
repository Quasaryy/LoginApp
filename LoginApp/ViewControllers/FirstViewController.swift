//
//  ViewController.swift
//  LoginApp
//
//  Created by Yury on 12.01.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTF.clearButtonMode = .whileEditing
        passwordTF.clearButtonMode = .whileEditing
        //usernameTF.textContentType = .username
        //passwordTF.textContentType = .password
        passwordTF.isSecureTextEntry = true
        
    }

    @IBAction func forgotPasswordTapped() {
        showAlert(title: "Opps!", message: "Your password is \"password\" 😉")
    }
    
    @IBAction func loginTapped() {
        guard usernameTF.text == "User" && passwordTF.text == "password" else {
            showAlert(title: "Invalid login or password", message: "Please enter correct login and password")
            passwordTF.text = nil
            return
        }
        performSegue(withIdentifier: "DashboardVC", sender: nil)
    }
    
    @IBAction func forgotUsernameTapped() {
        showAlert(title: "Opps!", message: "Your name is \"User\" 😉")
    }
    
    @IBAction func unwindSegueToVC(segue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
}

extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}

