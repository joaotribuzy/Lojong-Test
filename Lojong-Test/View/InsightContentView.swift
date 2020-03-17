//
//  ContentView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightContentView: UIView, LojongCustomView {
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.style()
        self.autolayout()
        
        self.setupNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual
    func style() {
        self.backgroundColor = .white
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // MARK: - Notifications
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeToVideoViewController), name: .LojongChangeToVideoViewController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToArticlesViewController), name: .LojongChangeToArticlesViewController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToQuotesViewController), name: .LojongChangeToQuotesViewController, object: nil)
    }
    
    // MARK: - ContentView Segmented Control Changes
    @objc
    private func changeToVideoViewController() {
        self.backgroundColor = .blue
    }
    
    @objc
    private func changeToArticlesViewController() {
        self.backgroundColor = .green
    }
    
    @objc
    private func changeToQuotesViewController() {
        self.backgroundColor = .cyan
    }
}
