//
//  InsightView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightMainView: UIView, LojongCustomView {
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    private let contentView = InsightContentViewController()
    private let customSegmentedControl = InsightCustomSegmentedControlViewController()
    
    func style() {
        // MainView
        self.backgroundColor = UIColor.init(red: 224, green: 144, blue: 144)
    }
    
    func autolayout() {
        // Main View
        self.top(0.0).left(0.0).right(0.0).bottom(0.0)
        
        // Custom Segmented Control
        sv(customSegmentedControl.view)
        customSegmentedControl.view.height(45).width(360).centerHorizontally()
        customSegmentedControl.view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        
        
        // ContentView Position
        sv(contentView.view)
        contentView.view.left(0.0).right(0.0)
        contentView.view.topAnchor.constraint(equalTo: self.customSegmentedControl.view.bottomAnchor, constant: 12).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    
}
