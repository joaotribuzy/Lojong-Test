//
//  ViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 11/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterCrashes

class MainTabBarViewController: UITabBarController{
    
    let fundamentViewController = PracticeTableViewController()
    let insightViewController = InsightMainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MSAppCenter.start("b9940f5c-bf2f-4571-9174-5479143dd944", withServices:[
          MSCrashes.self
        ])
        
        self.settingTabs()
        
        self.style()
        self.autolayout()
        
    }
    let topSeparator: UIView = UIView()
    
    
    //MARK: - Tabs Configuration
    private func settingTabs(){
        
        fundamentViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Práticas", comment: ""), image: UIImage.init(named: "practice-item"), tag: 0)
        
        insightViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Insight", comment: ""), image: UIImage.init(named: "Insight-Item"), tag: 1)
        
        let tabBarList = [fundamentViewController, insightViewController]

        viewControllers = tabBarList
    }
    

}

