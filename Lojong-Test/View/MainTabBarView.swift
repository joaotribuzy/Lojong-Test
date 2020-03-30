//
//  MainTabBarView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension MainTabBarViewController: LojongCustomView {
    //MARK: - Style
    func style() {
        self.tabBar.tintColor = UIColor(red: 194, green: 123, blue: 136)
        self.tabBar.barTintColor = UIColor(red: 255, green: 255, blue: 255)
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tabBar.layer.shadowRadius = 4.0
        self.tabBar.layer.shadowColor = UIColor.gray.cgColor
        self.tabBar.layer.shadowOpacity = 0.6
        if #available(iOS 13.0, *) {
            self.tabBar.standardAppearance.shadowImage = UIImage()
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func autolayout() {
    }
}
