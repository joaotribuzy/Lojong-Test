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
        let fundamentItemImage = UIImage.init(named: "Fundaments-Item")
        fundamentViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Fundaments", comment: ""), image: fundamentItemImage, tag: 0)
        
        
        let insightViewController = UIViewController()
        let insightItemImage = UIImage.init(named: "Insight-Item")
        insightViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Insight", comment: ""), image: insightItemImage, tag: 1)

        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }


}

