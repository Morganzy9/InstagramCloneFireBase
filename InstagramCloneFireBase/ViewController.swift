//
//  ViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
        
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        
        
    }
    
}

