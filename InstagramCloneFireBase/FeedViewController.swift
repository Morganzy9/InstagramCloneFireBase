//
//  FeedViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/30/23.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage


class FeedViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    var userEmailArray = [String]()
    var userCommetArray = [String]()
    var likeLabelArray = [Int]()
    var imageArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        getDataFromFireStore()
        
    }
    

    func getDataFromFireStore() {
        
        
        let firestoreDataBase = Firestore.firestore()
        
        firestoreDataBase.collection("Posts").addSnapshotListener { querySnapshot, error in
            
            if error != nil {
                
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")

                
            } else {
                
//                MARK: Getting
                
                guard let documents =  querySnapshot?.documents else {
                    
                    print("Error in documents")
                    
                    return
                }
                
                if querySnapshot?.isEmpty == false && querySnapshot != nil {
                    
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.imageArray.removeAll(keepingCapacity: false)
                    self.likeLabelArray.removeAll(keepingCapacity: false)
                    self.userCommetArray.removeAll(keepingCapacity: false)
                    
                    for document in documents {
                         
                        guard let postedby = document.get("postBy") as? String else {

                            print("Error in postedBy")

                            return

                        }

                        self.userEmailArray.append(postedby)
                        
                        
                        guard let postCom = document.get("postComment") as? String else {
                            
                            print("Error in postCom")
                            
                            return
                        }
                        
                        self.userCommetArray.append(postCom )
                        
                        guard let like = document.get("likes") as? Int else {
                            
                            print("Error in Like")
                            
                            return
                        }
                        
                        self.likeLabelArray.append(like)
                        
                        guard let imageUrl = document.get("imageUrl") as? String else {
                            print("Error in image")
                            
                            
                            return
                        }
                        
                        self.imageArray.append(imageUrl)
                        
                        
//                        Reload data
                        
                        self.tableView.reloadData()
                        
                    }
                    
                }
                
            }
            
            
        }
    
        
    }
    

    
    func makeAlert(title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
    
}


extension FeedViewController : UITableViewDelegate {
    
    
    
    
}

extension FeedViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userEmailArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.likeLabel.text = String(likeLabelArray[indexPath.row])
        cell.commentLabel.text = userCommetArray[indexPath.row]
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: imageArray[indexPath.row]))
        
        
        return cell
    }
    

    
    
    
    
}


