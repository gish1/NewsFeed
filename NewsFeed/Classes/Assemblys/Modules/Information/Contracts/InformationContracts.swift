//
//  InformationContracts.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol InformationModuleInput {
    func setDetailModel(model: NewsViewModel)
}

// Module Output
protocol InformationModuleOutput {
    
}

// View Input
protocol InformationViewInput: class {
    func set(title: String)
    func set(model: NewsViewModel)
}

// View Output
protocol InformationViewOutput: class {
    func viewDidLoad()
    func cancelDidTap()
}

// Interactor
protocol InformationInteractorInput {
    
}

// Router
protocol InformationRouterProtocol: AlertRoutable {
    func popModule()
}
