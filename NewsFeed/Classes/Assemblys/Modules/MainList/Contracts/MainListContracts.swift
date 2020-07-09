//
//  MainListContracts.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol MainListModuleInput {
    func setCategory(category: String)
}

// Module Output
protocol MainListModuleOutput {
    
}

// View Input
protocol MainListViewInput: class {
    func set(title: String)
    func set(with: [[String : String]])
    func set(category: String)
}

// View Output
protocol MainListViewOutput: class {
    func viewDidLoad()
    func viewLoadInformation()
    func informationDidTap(with: NewsViewModel)
    func categoryDidTap(with: [NewsViewModel])
    
}

// Interactor
protocol MainListInteractorInput {
    func obtainNews() -> [[String: String]]
}

// Router
protocol MainListRouterProtocol: AlertRoutable {
    func showInformation(model: NewsViewModel)
    func showCategory(model: [NewsViewModel])
}
