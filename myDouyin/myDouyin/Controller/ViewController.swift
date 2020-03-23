//
//  ViewController.swift
//  myDouyin
//
//  Created by jfx on 2019/11/28.
//  Copyright © 2019 zkbc. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: NVActivityIndicatorView!
    var awemeList = [AwemeList]()
    var jsonUrlIndex = 12
    var currentPage = 0
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return awemeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoCell
        cell.aweme = awemeList[indexPath.row]
//        cell.textLabel?.text = awemeList[indexPath.row].desc
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        jsonUrlIndex -= 1
        getList()
        currentPage = tableView.indexPathsForVisibleRows!.last!.row
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
    }
    func getList() {
        loadingView.startAnimating()
        let url = URL(string: DouyinURL.baseLocal + jsonUrlIndex.description + DouyinURL.feedFile)!
        getAwelist(url: url)
        
    }
    func getAwelist(url:URL) {
        do {
           let feed = try Feed(fromURL: url)
            if let awemeList = feed.awemeList {
                self.awemeList += awemeList
                self.tableView.reloadData()
                loadingView.stopAnimating()
            }
        } catch  {
            loadingView.stopAnimating()
            debugPrint("解析错误",error)
        }
    }

}

