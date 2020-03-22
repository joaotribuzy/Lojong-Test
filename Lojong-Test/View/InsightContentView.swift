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
    var videoTableViewController: UITableViewController = InsightVideoTableViewController(style: .plain)
    var articleTableViewController: UITableViewController = InsightArticleTableViewController(style: .plain)
    var quoteTableViewController: UITableViewController = InsightQuoteTableViewController(style: .plain)
    
    func style() {
        self.backgroundColor = .white
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // videoTableViewController
        
    }
    
    func autolayout() {
        // contentView
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // insightContentTableView
        sv(videoTableViewController.view)
        videoTableViewController.view.right(0.0).left(0.0).top(0.0).bottom(0.0)
        
        sv(articleTableViewController.view)
        articleTableViewController.view.top(0).right(0).bottom(0).left(0)
        articleTableViewController.view.alpha = 0
        
        sv(quoteTableViewController.view)
        quoteTableViewController.view.top(0).right(0).bottom(0).left(0)
        quoteTableViewController.view.alpha = 0
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
        UIView.animate(withDuration: 0.2, animations: {
            self.videoTableViewController.view.alpha = 1
            self.articleTableViewController.view.alpha = 0
            self.quoteTableViewController.view.alpha = 0
        })
    }
    
    @objc
    private func changeToArticlesViewControllerNotificationReceived(_ notification: Notification) {
        UIView.animate(withDuration: 0.2, animations: {
            self.videoTableViewController.view.alpha = 0
            self.articleTableViewController.view.alpha = 1
            self.quoteTableViewController.view.alpha = 0
        })
    }
    
    @objc
    private func changeToQuotesViewControllerNotificationReceived(_ notification: Notification) {
        UIView.animate(withDuration: 0.2, animations: {
            self.videoTableViewController.view.alpha = 0
            self.articleTableViewController.view.alpha = 0
            self.quoteTableViewController.view.alpha = 1
        })
    }
}

