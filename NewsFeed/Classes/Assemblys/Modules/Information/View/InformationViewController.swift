//
//  InformationViewController.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit
import SDWebImage

class InformationViewController: UIViewController, InformationViewInput {
    var output: InformationViewOutput!
    var model : NewsViewModel!
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var headlineNewsLabel: UILabel!
    @IBOutlet weak var newsСontentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureView()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension InformationViewController {
    func configureNavigationBar() {
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_round-arrow-back-ios"), style: .plain, target: self, action: #selector(cancelButtonAction(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    func configureView() {
        headlineNewsLabel.text = self.model.title
        newsСontentLabel.text = self.model.fullText
        
        if !self.model.enclosure.isEmpty {
            imageNews.sd_setImage(with: URL(string: self.model.enclosure), completed: nil)
        } else {
            imageNews = nil
        }
    }
}

// MARK: View Input
extension InformationViewController {
    func set(title: String) {
    }
    
    func set(model: NewsViewModel) {
        self.model = model
    }
}

// MARK: Button Action
extension InformationViewController {
    @objc func cancelButtonAction(_ sender: Any?){
        output.cancelDidTap()
    }
}
