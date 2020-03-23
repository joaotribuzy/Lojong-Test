//
//  InsightCustomVideoTableViewCell.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class InsightCustomVideoTableViewCell: UITableViewCell {
    
    // MARK: - TableViewCell Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupNotification()
        
        self.autolayout()
        self.style()
        
        self.setupImageViewTouch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Components
    var model: InsightVideoModelController = {
        return InsightVideoModelController.shared
    }()
    
    public var titleLabel = UILabel()
    public var videoPreviewImage = UIImageView()
    public var descriptionLabel = UILabel()
    public var shareButton = UIButton()
    public var separatorLine = UIView()
    
    public var shareLabel = UILabel()
    public var shareIcon = UIImageView()
    
    public var playButton: UIImageView = UIImageView()
    
    // MARK: - Data Receiver
    private var video: InsightVideo? = nil
    public var player: AVPlayer? = nil

}

// MARK: Content
extension InsightCustomVideoTableViewCell{
    func fill(_ video: InsightVideo){
        
        self.video = video
        
        self.titleLabel.text = "EP \(video.order): \(video.name.uppercased())"
        
        self.videoPreviewImage.image = video.videoImage
        
        self.descriptionLabel.text = video.description
    }
    
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(endpointDownloadedImageReceive(_:)), name: .LojongVideoPreviewImageDownloaded, object: nil)
        
    }
    
    @objc private func endpointDownloadedImageReceive(_ notification: Notification) {
        DispatchQueue.main.async {
            self.videoPreviewImage.image = self.video?.videoImage
        }
    }
    
    func setupImageViewTouch(){
        self.videoPreviewImage.isUserInteractionEnabled = true
        self.videoPreviewImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeVideoURL)))
    }
    
    @objc private func changeVideoURL(){
        model.clickedVideoURL = URL(string: self.video!.aws_url)
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .LojongPlayVideoOnController, object: nil)
        }
    }

}
