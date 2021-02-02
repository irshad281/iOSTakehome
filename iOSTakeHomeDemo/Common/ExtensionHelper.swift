//
//  ExtensionHelper.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import UIKit
import SDWebImage


extension UIScrollView {
    
    func shouldPaginate()->Bool {
        let currentOffset = self.contentOffset.y
        let maximumOffset = self.contentSize.height - self.frame.size.height
        if (maximumOffset - currentOffset <= 20) {
            return true
        }
        return false
    }
    
}





extension UIImageView {

    func loadFrom(url:String){
        let imageUrl = URL.init(string: url)
        SDWebImageDownloader.shared.downloadImage(with: imageUrl, options: .highPriority, progress: nil) { (image, data, error, status) in
            self.image = image
        }
    }
    
}
