//
//  ContentView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

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
    let insightContentTableView = InsightVideoTableViewController(style: .plain)
    
    func style() {
        self.backgroundColor = .white
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func autolayout() {
        // contentView
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // insightContentTableView
        sv(insightContentTableView.view)
        insightContentTableView.view.right(0.0).left(0.0).top(0.0).bottom(0.0)
        
    }
    
    // MARK: - Notifications
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeToVideoViewControllerNotificationReceived(_:)), name: .LojongChangeToVideoViewController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToArticlesViewControllerNotificationReceived(_:)), name: .LojongChangeToArticlesViewController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToQuotesViewControllerNotificationReceived(_:)), name: .LojongChangeToQuotesViewController, object: nil)
    }
    
    // MARK: - ContentView Segmented Control Changes
    @objc
    private func changeToVideoViewControllerNotificationReceived(_ notification: Notification) {
        
    }
    
    @objc
    private func changeToArticlesViewControllerNotificationReceived(_ notification: Notification) {

    }
    
    @objc
    private func changeToQuotesViewControllerNotificationReceived(_ notification: Notification) {
        
    }
}
