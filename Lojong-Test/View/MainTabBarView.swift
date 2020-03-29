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
        self.tabBar.standardAppearance.shadowImage = UIImage()
        
    }
    
    func autolayout() {
    }
}
