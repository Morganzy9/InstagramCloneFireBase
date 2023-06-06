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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        
        
        
    }
    
    
    
    
}
