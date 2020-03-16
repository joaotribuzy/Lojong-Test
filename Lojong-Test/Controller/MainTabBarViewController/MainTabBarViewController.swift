//
//  ViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 11/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController{
    
    let fundamentViewController = UIViewController()
    let insightViewController = InsightViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTabs()
        
        self.style()
        self.autolayout()
    
    }
    
    //MARK: - Tabs Configuration
    private func settingTabs(){
        
        fundamentViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Fundaments", comment: ""), image: UIImage.init(named: "Fundaments-Item"), tag: 0)
        
        insightViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Insight", comment: ""), image: UIImage.init(named: "Insight-Item"), tag: 1)
        
        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }
}

