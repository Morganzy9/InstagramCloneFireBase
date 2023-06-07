//
//  FeedCell.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 6/3/23.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    @IBOutlet var userEmailLabel: UILabel!
    
    @IBOutlet var commentLabel: UILabel!
    
    @IBOutlet var likeLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var postImage: UIImageView!
    
    var documentIdLabel = UILabel()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDataBase = Firestore.firestore()
        
        guard let docID = documentIdLabel.text else {
            
            print("Error in ID")
            
            return
        }
        
        guard let likeCount = Int(likeLabel.text!) else {
            
            print("Error in likeCount")
            
            return
        }
        
        let likeStore = ["likes" : likeCount + 1] as [String : Any]
        
        fireStoreDataBase.collection("Posts").document(docID).setData(likeStore, merge: true)
        
        
    }
    
    
    
    
}
