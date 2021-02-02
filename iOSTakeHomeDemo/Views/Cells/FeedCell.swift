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
    @IBOutlet weak var dateLabel:UILabel!
    
    @IBOutlet weak var likeButton:UIButton!
    @IBOutlet weak var commentButton:UIButton!
    @IBOutlet weak var bookmarkButton:UIButton!
    
    
    @IBOutlet weak var tagsCollectionView:UICollectionView!
    
    let colors:[UIColor] = [#colorLiteral(red: 0.2753904462, green: 0.783030808, blue: 0.6957221627, alpha: 1),#colorLiteral(red: 0.3991103768, green: 0.2732118666, blue: 0.9405748248, alpha: 1),#colorLiteral(red: 0.4534602761, green: 0.8006942868, blue: 0.2852738202, alpha: 1)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        let layout = TagCellLayout.init(alignment: .left, delegate: self)
        tagsCollectionView.collectionViewLayout = layout
    }
    
    
    
    var feed:FeedModel?{
        didSet{
            
            nameLabel.text = feed?.owner?.firstName
            descLabel.text = feed?.text
            likeButton.setTitle(feed?.likes, for: .normal)
            if let url = feed?.owner?.picture {
                profileImage.loadFrom(url: url)
            }
            
            if let url = feed?.image {
                postImage.loadFrom(url: url)
            }
            tagsCollectionView.reloadData()
            let time = feed?.publishDate?.syncDate()?.time() ?? ""
            let date = feed?.publishDate?.syncDate()?.EEEE_MMMM_d_YYYY() ?? ""
            dateLabel.text =  "\(date) @ \(time)"
        }
    }
    
}





extension FeedCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, TagCellLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feed?.tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        cell.nameLabel.backgroundColor = UIColor.random
        cell.nameLabel.text = feed?.tags?[indexPath.item]
        return cell
    }
    
    func tagCellLayoutTagSize(layout: TagCellLayout, atIndex index: Int) -> CGSize {
        let text = feed?.tags?[index] ?? ""
        let font = UIFont.init(name: "Avenir Next Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        let width = widthForLabel(text, font: font) + 40
        return .init(width: width, height: 58)
    }
}
