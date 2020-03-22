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
    
    // MARK: - TableViewCOntroller Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.tableView = InsightQuoteTableView(frame: .zero, style: .plain)
        
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
}

extension InsightQuoteTableViewController{
    // MARK: - TableView Settings
    func setupTableView(){
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "quoteCell")
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return fakeDB.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
            
    //        let video = model.insightVideos[indexPath.row]
    //
    //        cell.fill(video)
            
            cell.textLabel?.text = fakeDB[indexPath.row]

            return cell
            
            
        }
}
