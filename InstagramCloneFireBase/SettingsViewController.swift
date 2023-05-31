//
//  SettingsViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/30/23.
//

import UIKit

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
        
        performSegue(withIdentifier: "ToSingVC", sender: nil)
        
    }
    
    
}
