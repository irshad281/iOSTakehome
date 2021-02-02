//
//  ViewController.swift
//  iOSTakeHomeDemo
//
//  Created by Irshad Ahmed on 02/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    /// url helper for feed
    let feedUrl = FeedURLBuilder()
    
    /// array of feed model
    var feeds = [FeedModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = nil
        self.loadFeeds()
    }


}





extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        cell.feed = feeds[indexPath.row]
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.shouldPaginate() {
            self.loadFeeds()
        }
    }

}





extension ViewController {
    
    func loadFeeds() {
        guard let url = feedUrl.next() else {return}
        
        APIsHandler.GET(url, header: headers) { (response, error, _) in
            if let err = error {
                print(err.localizedDescription)
            }else if let json = response {
                print(json)
                if self.feedUrl.page == 1 {
                    self.feeds = json["data"].array?.decode() ?? []
                }else{
                    let data:[FeedModel] = json["data"].array?.decode() ?? []
                    self.feeds.append(contentsOf: data)
                }
                self.feedUrl.total = json["total"].intValue
                self.tableView.reloadData()
            }
        }
    }
}
