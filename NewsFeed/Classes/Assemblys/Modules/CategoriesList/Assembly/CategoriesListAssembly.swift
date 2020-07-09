//
//  CategoriesListAssembly.swift
//  NewsFeed
//
//  Created by Пк on 08.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias CategoriesListModule = Module<CategoriesListModuleInput, CategoriesListModuleOutput>

class CategoriesListAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> CategoriesListModule {
        // View
        let view = CategoriesListViewController.controllerFromStoryboard("CategoriesList")
        
        // Interactor
        let interactor = CategoriesListInteractor()
        
        // Router
        let router = CategoriesListRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = CategoriesListPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
