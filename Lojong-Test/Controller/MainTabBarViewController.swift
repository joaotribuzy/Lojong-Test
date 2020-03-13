//
//  ViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 11/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTabs()
    }
    
    //MARK: - Tabs Configuration
    private func settingTabs(){
        let fundamentViewController = UIViewController()

        fundamentViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
        let insightViewController = UIViewController()
                
        insightViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }


}

