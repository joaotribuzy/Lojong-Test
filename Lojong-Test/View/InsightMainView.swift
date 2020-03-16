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
        self.layoutMargins = .zero
        
        // Custom Segmented Control
        self.addSubview(customSegmentedControl.view)
        
        let customSegmentedControlConstrainsts = [
            customSegmentedControl.view.heightAnchor.constraint(equalToConstant: 45),
            customSegmentedControl.view.widthAnchor.constraint(equalToConstant: 360),
            customSegmentedControl.view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            customSegmentedControl.view.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(customSegmentedControlConstrainsts)
        
        
        // ContentView Position
        self.addSubview(contentView.view)
        
        let contentViewConstraints = [
            contentView.view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            contentView.view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            contentView.view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 65),
            contentView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ]
        
        NSLayoutConstraint.activate(contentViewConstraints)
        
        
        
        
    }
    
    
}
