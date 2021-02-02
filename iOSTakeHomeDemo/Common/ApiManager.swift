//
//  ApiManager.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import Foundation

let APIsHandler = ApiManager.shared

public protocol JSONDecodable{
    init(json:JSON)
}

let headers:[String:String] = [
    "app-id":"600e1a3c7bdbc316a88599a4"
]

extension Collection where Iterator.Element == JSON {
    
    func decode<T:JSONDecodable>() -> [T] {
        return map({T(json:$0)})
    }
    
    func arrayDict() ->[[String:Any]]{
        var items:[[String:Any]] = []
        self.forEach({
            if let obj = $0.dictionaryObject {
               items.append(obj)
            }
        })
        return items
    }
    
    func arrayString() ->[String]{
        
        var items:[String] = []
        
        self.forEach({ items.append($0.stringValue) })
        
        return items
    }

}




class ApiManager {
    
    static let shared = ApiManager.init()
    private init() {}
    
    
    func GET(_ url: String, header : [String : String]? , completion:@escaping (_ jsonData:JSON? , _ error:Error?, _ statuscode : Int?)->()){
        
        let session = URLSession.shared
        var urlRequest = URLRequest.init(url: URL.init(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = header
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let err = error {
                    completion(nil , err, 0)
                }else if let jsonData = data {
                    let json = try? JSON.init(data: jsonData)
                    completion(json , nil, 0)
                }else{
                    completion(nil , nil, 0)
                }
            }
        }.resume()
    }
    
}
