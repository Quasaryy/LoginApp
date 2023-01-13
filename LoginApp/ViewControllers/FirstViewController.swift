//
//  ViewController.swift
//  LoginApp
//
//  Created by Yury on 12.01.23.
//

import UIKit

class FirstViewController: UIViewController {
    
    var user: Users!
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Text fields settings
        usernameTF.clearButtonMode = .whileEditing
        passwordTF.clearButtonMode = .whileEditing
        //usernameTF.textContentType = .username
        //passwordTF.textContentType = .password
        passwordTF.isSecureTextEntry = true
        
    }
    
    // MARK: Prepare segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBar = segue.destination as! UITabBarController
        let dashboardVC = tabBar.viewControllers?.first as! DashboardViewController
        dashboardVC.user = user
        let detailsVC = tabBar.viewControllers![1] as! DetailsViewController
        detailsVC.user = user
    }

    // MARK: Forgot password button with alert window
    @IBAction func forgotPasswordTapped() {
        showAlert(title: "Opps!", message: "Your password is \"password\" 😉")
    }
    
    // MARK: Login button logic
    @IBAction func loginTapped() {
        // checking for correct login and password
        guard checkLoginAndPassword(in: usersArray) else {
            // showing alert window if not correct
            showAlert(title: "Invalid login or password", message: "Please enter correct login and password")
            passwordTF.text = nil
            return
        }
        // going to dashboard
        performSegue(withIdentifier: "DashboardVC", sender: nil)
    }
    
    // MARK: Forgot username button with alert window
    @IBAction func forgotUsernameTapped() {
        showAlert(title: "Opps!", message: "Your name is \"User\" 😉")
    }
    
    // MARK: Returning to login screen from dashboard screen
    @IBAction func unwindSegueToVC(segue: UIStoryboardSegue) {
        // erasing text in text fields after returning
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: Checking for valid username and password in users array
    func checkLoginAndPassword(in array: [Users]) -> Bool {
        for user in array {
            if usernameTF.text == user.login {
                if passwordTF.text == user.password {
                    self.user = user
                    return true
                }
            }
        }
        return false
    }
    
}

// MARK: Creating func for alert window
extension FirstViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(buttonOK)
        present(alert, animated: true)
    }
}

// MARK: Working with keyboard in text fields
extension FirstViewController: UITextFieldDelegate {
    // Dissmising keyboard after touching any non text field screen part
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: Working with the "Next" and "Done" buttons on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // going to the next text field by tapping Next
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            // going to the dashboard after tapping Done
            loginTapped()
        }
        return true
    }
}

