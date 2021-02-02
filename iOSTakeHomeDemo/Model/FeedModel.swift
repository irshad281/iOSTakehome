//
//  FeedModel.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import Foundation


class FeedModel: JSONDecodable {
    
    var owner:Owner?
    var id:String?
    var image:String?
    var publishDate:String?
    
    var text:String?
    var tags:[String]?
    var link:String?
    var likes:String?
    
    required init(json: JSON) {
        
        owner = Owner.init(json: json["owner"])
        id = json["id"].stringValue
        image = json["image"].stringValue
        publishDate = json["publishDate"].stringValue
        
        text = json["text"].stringValue
        tags = json["tags"].array?.compactMap({$0.stringValue})
        link = json["link"].stringValue
        likes = json["likes"].stringValue
    }
}


class Owner: JSONDecodable {
    
    var id:String?
    var title:String?
    var firstName:String?
    
    var picture:String?
    var email:String?
    var lastName:String?
    
    
    required init(json: JSON) {
        
        id = json["id"].stringValue
        title = json["title"].stringValue
        firstName = json["firstName"].stringValue
        
        picture = json["picture"].stringValue
        email = json["email"].stringValue
        lastName = json["lastName"].stringValue
    }
}
