//
//  MainListViewController.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit
import Foundation

class MainListViewController: UITableViewController, MainListViewInput {
    
    var output: MainListViewOutput!
    var parsedArr = [NewsViewModel]()
    let refreshTable: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        output.viewLoadInformation()
        tableView.refreshControl = refreshTable
    }
    
    func sortCategory(category: String)  {
        parsedArr = parsedArr.filter { $0.category.uppercasedFirst == category }
    }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension MainListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        
        let news = parsedArr[indexPath.row]
        
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = news.title
        cell?.detailTextLabel?.textColor = .lightGray
        cell?.detailTextLabel?.text = news.pubDate
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsedArr.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = parsedArr[indexPath.row]
        output.informationDidTap(with: news)
    }
}

// MARK: View Input
extension MainListViewController {
    func set(title: String) {
        self.title = title
    }
    
    func set(with: [[String:String]]) {
        parsedArr.removeAll()
        for item in with {
            let news = NewsViewModel(with: item)
            parsedArr.append(news)
        }
    }
    
    func set(category: String) {
        tableView.reloadData()
        if category != "Все новости" {
            sortCategory(category: category)
            tableView.reloadData()
            tableView.refreshControl = nil
        }
    }
}

// MARK: Button Action
extension MainListViewController {
    @objc func refresh(sender: UIRefreshControl) {
        DispatchQueue.global().async {
            self.output.viewLoadInformation()
            DispatchQueue.main.async {
                sender.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func categoryButtonAction(_ sender: UIButton) {
        output.viewLoadInformation()
        output.categoryDidTap(with: self.parsedArr)
    }
}
