//
//  MainListViewModel.swift
//  NewsFeed
//
//  Created by Пк on 07.07.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class NewsViewModel {
    var title : String
    var category : String
    var pubDate : String
    var fullText : String
    var enclosure : String
    
    init(with response: [String : String] ) {
        self.title = response["title"] ?? ""
        self.category = response["category"] ?? ""
        self.pubDate = response["pubDate"]?.stringDate ?? ""
        self.fullText  = response["yandex:full-text"] ?? ""
        self.enclosure = response["enclosure"] ?? ""
    }
}
