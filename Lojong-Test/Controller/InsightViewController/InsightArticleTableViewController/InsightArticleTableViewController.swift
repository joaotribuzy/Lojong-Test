//
//  InsightArticleTableViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 20/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

let fakeDB = ["Zelda", "Link", "Goron", "Ganon", "Epona"]

class InsightArticleTableViewController: UITableViewController {
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.tableView = InsightArticleTableView(frame: .zero, style: .plain)
        
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
}

extension InsightArticleTableViewController{
    
    // MARK: - TableView Settings
    func setupTableView(){
        tableView.register(InsightArticleTableViewCell.self, forCellReuseIdentifier: "articleCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeDB.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! InsightArticleTableViewCell
        
//        let video = model.insightVideos[indexPath.row]
//
//        cell.fill(video)
        
        cell.titleLabel.text = fakeDB[indexPath.row]

        return cell
        
        
    }
}
