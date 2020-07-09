//
//  MainListInteractor.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class MainListInteractor: MainListInteractorInput {
    func obtainNews() -> [[String: String]] {
        var parseArr = [[String: String]]()
        let parser = RSSParser()
        parser.startParsingWithContentOfURL(rssURL: URL(string: Constants.Network.rssUrl.rawValue)!) { (arr) in
            parseArr = arr
        }
        return parseArr
    }
}

// MARK: Private
extension MainListInteractor {
    
}
