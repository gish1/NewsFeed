//
//  CategoriesListPresenter.swift
//  NewsFeed
//
//  Created by Пк on 08.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class CategoriesListPresenter: BasePresenter<CategoriesListInteractorInput, CategoriesListRouterProtocol>, CategoriesListModuleOutput {
    
    // MARK: - Weak properties
    weak var view: CategoriesListViewInput?
}

// MARK: Private
extension CategoriesListPresenter {
    
}

// MARK: Module Input
extension CategoriesListPresenter: CategoriesListModuleInput {
    func setCategoryModel(model: [NewsViewModel]) {
        view?.set(model: model)
    }
    
    
}

// MARK: View Output
extension CategoriesListPresenter: CategoriesListViewOutput {
    func mainDidTap(category: String) {
        router.showMainList(category: category)
    }
    
    func viewDidLoad() {
        view?.set(title: "CategoriesList")
    }
    
}
