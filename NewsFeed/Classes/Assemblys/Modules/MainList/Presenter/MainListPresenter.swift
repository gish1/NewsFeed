//
//  MainListPresenter.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class MainListPresenter: BasePresenter<MainListInteractorInput, MainListRouterProtocol>, MainListModuleOutput {
    
    // MARK: - Weak properties
    weak var view: MainListViewInput?
}

// MARK: Private
extension MainListPresenter {
    
}

// MARK: Module Input
extension MainListPresenter: MainListModuleInput {
    func setCategory(category: String) {
        view?.set(category: category)
        view?.set(title: category)
    }
}

// MARK: View Output
extension MainListPresenter: MainListViewOutput {
    func categoryDidTap(with: [NewsViewModel]) {
        router.showCategory(model: with)
    }
    
    func viewLoadInformation() {
        let viewModel = interactor.obtainNews()
        view?.set(with: viewModel)
    }
    
    func viewDidLoad() {
        view?.set(title: "Все новости")
    }
    
    func informationDidTap(with: NewsViewModel) {
        router.showInformation(model: with)
    }
    
}
