//
//  InsightArticleTableViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 20/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightArticleTableViewController: UITableViewController {
    
    var model: InsightArticleModelController = {
        return InsightArticleModelController.shared
    }()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.setupNotification()
        
        self.tableView = InsightArticleTableView(frame: .zero, style: .plain)
        
        self.setupTableView()
        
        self.model.downloadArticle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension InsightArticleTableViewController{
    
    // MARK: - TableView Settings
    func setupTableView(){
        tableView.register(InsightArticleTableViewCell.self, forCellReuseIdentifier: "articleCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.insightArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! InsightArticleTableViewCell
        
        let article = model.insightArticles[indexPath.row]
        
        cell.fill(article)

        return cell
    }
}

extension InsightArticleTableViewController{
    // MARK: - Notification
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(articlesChangedNotificationReceived(_:)), name: .LojongArticlesChanged, object: nil)
    }
    
    @objc private func articlesChangedNotificationReceived(_ notification: Notification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
