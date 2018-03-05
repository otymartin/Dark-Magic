//
//  DarkMagicViewController.swift
//  Dark Magic
//
//  Created by Martin Otyeka on 2018-03-04.
//  Copyright © 2018 Dopeness Academy. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
import SnapKit
import ChameleonFramework

class DarkMagicViewController: TabmanViewController {
    
    var pageLabel = UILabel()
    
    var currentPage: Int = 1 {
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
        self.dataSource = self
        
    }
    
    func addLabel() {
        self.pageLabel.font = UIFont.systemFont(ofSize: 100, weight: .heavy)
        self.pageLabel.textColor = .white
        self.pageLabel.textAlignment = .center
        self.view.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { [weak self] (make) in
            guard let view = self?.view else { return }
            make.center.equalTo(view.snp.center)
        }
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, didScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, didScrollToPageAt: index, direction: direction, animated: animated)
        self.currentPage = index + 1
    }


}

extension DarkMagicViewController: PageboyViewControllerDataSource {
    
    func loadViewControllers() {
        for _ in 0...99 {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .randomFlat()
            self.viewControllers.append(viewController)
        }
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.viewControllers.count
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return Page.at(index: 0)
    }

}














