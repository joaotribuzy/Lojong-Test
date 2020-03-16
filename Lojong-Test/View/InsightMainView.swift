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
    private let contentView = UIView()
    
    func style() {
        // MainView
        self.backgroundColor = UIColor.init(red: 224, green: 144, blue: 144)
        
        // Content View
        self.contentView.backgroundColor = .white
    }
    
    func autolayout() {
        // Main View
        self.layoutMargins = .zero
        
        // ContentView
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewConstraints = [
            NSLayoutConstraint(item: contentView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 116),
            NSLayoutConstraint(item: contentView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: self,
                                attribute: .bottom,
                                multiplier: 1.0,
                                constant: 0),
            NSLayoutConstraint(item: contentView,
                                attribute: .right,
                                relatedBy: .equal,
                                toItem: self,
                                attribute: .right,
                                multiplier: 1.0,
                                constant: 0),
            NSLayoutConstraint(item: contentView,
                                attribute: .left,
                                relatedBy: .equal,
                                toItem: self,
                                attribute: .left,
                                multiplier: 1.0,
                                constant: 0)
        ]
        
        NSLayoutConstraint.activate(contentViewConstraints)
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    
}
