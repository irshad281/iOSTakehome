//
//  FeedURLBuilder.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import Foundation

class FeedURLBuilder {
    
    var page:Int = -1
    var limit = 10
    var basePath = "https://dummyapi.io/data/api/post"
    var total:Int = Int.max
    
    func next()->String? {
        let current_total = abs(page)*limit
        if current_total < total {
            page += 1
            let url = "\(basePath)?page=\(page)&limit=\(limit)"
            return url
        }
        return nil
    }
}
