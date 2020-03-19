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
    
    var model: LojongVideoDataController = {
        return LojongVideoDataController.shared
    }()
    
    // MARK: - TableViewController Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.tableView = InsightVideoTableView(frame: .zero, style: style)
        
        self.setupNotification()
        
        self.setupTableView()
        
        self.model.downloadVideo()

        
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
        return model.insightVideos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! InsightCustomVideoTableViewCell
        cell.titleLabel.text = "EP. \(String(describing: model.insightVideos[indexPath.row].order)): \(String(describing: model.insightVideos[indexPath.row].name.uppercased()))"
        let auxiliarImageView: UIImageView = UIImageView()
        
        auxiliarImageView.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
        
        if cell.videoPreviewImage.image == nil{
            cell.videoPreviewImage.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
        }else if auxiliarImageView.image != cell.videoPreviewImage.image{
            cell.videoPreviewImage.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
        }
        
        print(cell.videoPreviewImage)
        cell.descriptionLabel.text = "\(model.insightVideos[indexPath.row].description)"
        
        
        return cell
        
        
    }
}

// MARK: - Notifications
extension InsightVideoTableViewController{
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViewData), name: .LojongDataVideosDownloaded, object: nil)
    }
    
    @objc
    func reloadTableViewData(){
        self.tableView.reloadData()
    }
}

