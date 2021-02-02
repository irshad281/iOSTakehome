//
//  FeedCell.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImage:UIImageView!
    @IBOutlet weak var postImage:UIImageView!
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var descLabel:UILabel!
    
    @IBOutlet weak var likeButton:UIButton!
    @IBOutlet weak var commentButton:UIButton!
    @IBOutlet weak var bookmarkButton:UIButton!
    
    
    @IBOutlet weak var tagsCollectionView:UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    
    var feed:FeedModel?{
        didSet{
            
            nameLabel.text = feed?.owner?.firstName
            descLabel.text = feed?.text
            
            if let url = feed?.owner?.picture {
                profileImage.loadFrom(url: url)
            }
            
            if let url = feed?.image {
                postImage.loadFrom(url: url)
            }
        }
    }
    
}
