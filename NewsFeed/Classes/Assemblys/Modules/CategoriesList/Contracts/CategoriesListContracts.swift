//
//  CategoriesListContracts.swift
//  NewsFeed
//
//  Created by Пк on 08.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol CategoriesListModuleInput {
    func setCategoryModel(model: [NewsViewModel])
}

// Module Output
protocol CategoriesListModuleOutput {
    
}

// View Input
protocol CategoriesListViewInput: class {
    func set(title: String)
    func set(model: [NewsViewModel])
}

// View Output
protocol CategoriesListViewOutput: class {
    func viewDidLoad()
    func mainDidTap(category: String)
}

// Interactor
protocol CategoriesListInteractorInput {
}

// Router
protocol CategoriesListRouterProtocol: AlertRoutable {
     func showMainList(category: String)
}
