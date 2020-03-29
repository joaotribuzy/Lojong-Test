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
        
        self.setupNotification()
        
        self.setupTableView()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension PracticeTableViewController{
    // MARK: - TableView Settings
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func setupTableView(){
        tableView.register(FundamentsTableViewCell.self, forCellReuseIdentifier: "fundamentsCell")
        self.tableView.backgroundColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fundamentsCell", for: indexPath) as! FundamentsTableViewCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        headerView.height(35).left(0).right(0)
        headerView.backgroundColor = .white
        
        let sectionTitle: UILabel = UILabel()
        
        headerView.sv(sectionTitle)
        sectionTitle.font = UIFont(name: "Asap-Bold", size: 15)
        sectionTitle.textColor = .gray
        switch section {
        case 0:
            sectionTitle.text = NSLocalizedString("Treinamentos", comment: "Treinamentos")
        default:
            sectionTitle.text = ""
        }
        sectionTitle.left(20).centerVertically()
        
        return headerView
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fundamentsViewController = FundamentsViewController()
        fundamentsViewController.modalPresentationStyle = .custom
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        
        present(fundamentsViewController, animated: false, completion: nil)

    }
    
    // MARK: - Notification
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(dismissFundamentViewControllerNotificationReceived(_:)), name: .LojongDismissFundamentViewController, object: nil)
    }
    
    @objc private func dismissFundamentViewControllerNotificationReceived(_ notificatio: Notification){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: true, completion: nil)
    }
}
