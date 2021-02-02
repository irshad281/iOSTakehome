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



func widthForLabel(_ text: String, font:UIFont) -> CGFloat {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let estimatedFrame = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
    return estimatedFrame.size.width
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}



extension String {
    func syncDate() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}




extension Date {
    
    func EEEE_MMMM_d_YYYY()->String{
        let dateFromatter = DateFormatter.init()
        dateFromatter.dateFormat = "EEEE MMMM d, yyyy"
        return dateFromatter.string(from: self)
    }
    
    func time()->String {
        let dateFromatter = DateFormatter.init()
        dateFromatter.timeStyle = .short
        return dateFromatter.string(from: self)
    }
}
