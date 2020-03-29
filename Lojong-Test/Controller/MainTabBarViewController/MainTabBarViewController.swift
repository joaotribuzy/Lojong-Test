//
//  ViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 11/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController{
    
    let fundamentViewController = PracticeTableViewController()
    let insightViewController = InsightMainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTabs()
        
        self.style()
        self.autolayout()
        
    }
    let topSeparator: UIView = UIView()
    
    
    //MARK: - Tabs Configuration
    private func settingTabs(){
        
        fundamentViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Práticas", comment: ""), image: UIImage.init(named: "practice-item"), tag: 0)
        
        insightViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Insight", comment: ""), image: UIImage.init(named: "insight-item"), tag: 1)
        
        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }
    

}

