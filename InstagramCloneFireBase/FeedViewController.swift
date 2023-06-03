//
//  FeedViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/30/23.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    

}


extension FeedViewController : UITableViewDelegate {
    
    
    
    
}

extension FeedViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        return cell
    }
    

    
    
    
    
}


