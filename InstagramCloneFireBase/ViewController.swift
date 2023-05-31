//
//  ViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/29/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataResult, error in
                
                if error != nil {
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unlnown Error occurs")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
            }
            
            
            
        } else {
            
            makeAlert(title: "Empty Email or Password", message: "Please Enter the Email and Password")
            
        }
 
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
        
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataResult, error in
                
                if error != nil {
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error occurs")
                    
                }
                
                
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)

            }
            
        } else {
            
            makeAlert(title: "Empty Email or Password", message: "Please Enter the Email and Password")
            
        }
        
        
        
    }
    
    
    
    func makeAlert(title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
}

