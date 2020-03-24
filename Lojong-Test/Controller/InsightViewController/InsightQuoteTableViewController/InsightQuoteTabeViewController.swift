//
//  InsightQuoteTabeViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit


class InsightQuoteTableViewController: UITableViewController {
    
    var model: InsightQuoteModelController = {
        return InsightQuoteModelController.shared
    }()
    
    // MARK: - TableViewCOntroller Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.setupNotification()
        
        self.tableView = InsightQuoteTableView(frame: .zero, style: .plain)
        
        self.setupTableView()
        
        self.model.downloadQuote()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
}

extension InsightQuoteTableViewController{
    // MARK: - TableView Settings
    func setupTableView(){
            tableView.register(InsightQuoteTableViewCell.self, forCellReuseIdentifier: "quoteCell")
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.insightQuotes.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! InsightQuoteTableViewCell
            
            let quote = model.insightQuotes[indexPath.row]
            
            cell.fill(quote)

            return cell
        }
}

extension InsightQuoteTableViewController{
    // MARK: - Notification
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(quotesChangedNotificationReceived(_:)), name: .LojongQuotesChanged, object: nil)
    }
    
    @objc private func quotesChangedNotificationReceived(_ notification: Notification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
