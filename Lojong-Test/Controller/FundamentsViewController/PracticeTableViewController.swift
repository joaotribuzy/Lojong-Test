//
//  PracticeTableViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 25/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

let fakeDB = ["Zelda", "Ganon", "Link", "Epona"]

class PracticeTableViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = PracticeTableView()
        
        self.setupTableView()
    }
    
}

extension PracticeTableViewController{
    // MARK: - TableView Settings
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = fakeDB[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        headerView.height(35).left(0).right(0)
        headerView.backgroundColor = .white
        
        let sectionTitle: UILabel = UILabel()
        
        headerView.sv(sectionTitle)
        sectionTitle.font = UIFont(name: "Asap-Bold", size: 15)
        switch section {
        case 0:
            sectionTitle.text = NSLocalizedString("Treinamentos", comment: "Treinamentos")
        default:
            sectionTitle.text = ""
        }
        sectionTitle.left(20).centerVertically()
        
        return headerView
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
