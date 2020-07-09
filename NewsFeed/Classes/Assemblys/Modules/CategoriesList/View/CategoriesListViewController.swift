//
//  CategoriesListViewController.swift
//  NewsFeed
//
//  Created by Пк on 08.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class CategoriesListViewController: UITableViewController, CategoriesListViewInput {

    var output: CategoriesListViewOutput!
    var array : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension CategoriesListViewController {
    func sortArray(array: [NewsViewModel],completion: ([String]) -> Void) {
        var sortArray = [String]()
        
        for item in array {
            let obj = item.category.uppercasedFirst
            sortArray.append(obj)
        }
        let uniqueArray = Array(Set(sortArray))
        
        completion(uniqueArray.sorted(by: <))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
         
        if indexPath.row == 0 {
            cell?.textLabel?.text = "Все новости"
        } else {
            cell?.textLabel?.text = array[indexPath.row - 1]
        }
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count + 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            output.mainDidTap(category: "Все новости")
        } else {
            output.mainDidTap(category: array[indexPath.row - 1])
        }
    }
}

// MARK: View Input
extension CategoriesListViewController {
    func set(title: String) {
        self.title = title
    }
    
    func set(model: [NewsViewModel]) {
        sortArray(array: model) { (arr) in
            array = arr
        }
    }
}

// MARK: Button Action
extension CategoriesListViewController {
    
}
