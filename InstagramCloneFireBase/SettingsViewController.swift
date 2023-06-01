//
//  SettingsViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/30/23.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    var logOutButton: UIButton =  {
        
        var button = UIButton()
        
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .systemIndigo
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLogOutButton()
        
        
    }
    
    
    func setUpLogOutButton() {
        view.addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            
            logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.widthAnchor.constraint(equalToConstant: 280)
            
        ])
        
        
        
    }
    
    
    @objc func logOut() {
        
        
        /*
         
         do {
            
            try Auth.auth().signOut()
         
            performSegue(withIdentifier: "ToSignVC", comlition: nil)
         
         } catch {
            
            
         
         }
         
         */
        
        
        do {
            
            //            try Auth.auth().signOut()
            //      MARK: Warning Occurs
            //
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //
            //            let signVC = storyboard.instantiateViewController(withIdentifier: "SignID") as! ViewController
            //
            //            UIApplication.shared.windows.first?.rootViewController = signVC
            
            
            try Auth.auth().signOut()
            
            // Redirect to the login view controller
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               
               let delegate = windowScene.delegate as? SceneDelegate,
               
                let window = delegate.window {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let signVC = storyboard.instantiateViewController(withIdentifier: "SignID") as! ViewController
                
                window.rootViewController = signVC
            }
            
            
            
        } catch let error as NSError {
            
            let alert =  UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okButton)
            
            present(alert, animated: true)
            
        }
        
        
    }
    
    
}
