//
//  ViewController.swift
//  Dark Magic
//
//  Created by Martin Otyeka on 2018-03-04.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import ChameleonFramework

class TabViewController: TabmanViewController {
    
    var pageLabel = UILabel()
    
    var currentPage: Int = 0 {
        didSet {
            self.pageLabel.text = String(self.currentPage)
        }
    }
    
    var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLabel()
        self.loadViewControllers()
        self.delegate = self
        
    }
    
    func addLabel() {
        self.pageLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        self.pageLabel.textColor = .black
        self.pageLabel.textAlignment = .center
        self.view.addSubview(self.pageLabel)
    }


}

extension TabViewController: PageboyViewControllerDelegate, PageboyViewControllerDataSource {
    
    func loadViewControllers() {
        for _ in 0...100 {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .randomFlat()
        }
    }
    
}

