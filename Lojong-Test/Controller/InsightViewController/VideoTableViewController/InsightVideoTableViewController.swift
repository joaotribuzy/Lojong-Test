//
//  InsightVideoTableViewCOntroller.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightVideoTableViewController: UITableViewController {
    
    let characters = ["Zelda","Link","Ganon"]
    
    // MARK: - TableViewController Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.tableView = InsightVideoTableView(frame: .zero, style: style)
        
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Settings
extension InsightVideoTableViewController {
    func setupTableView(){
        tableView.register(InsightCustomVideoTableViewCell.self, forCellReuseIdentifier: "videoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! InsightCustomVideoTableViewCell
        cell.titleLabel.text = characters[indexPath.row]
        return cell
    }
}
