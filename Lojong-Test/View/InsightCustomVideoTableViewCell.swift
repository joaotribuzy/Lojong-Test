//
//  InsightCustomVideoTableViewCell.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightCustomVideoTableViewCell: UITableViewCell {
    
    // MARK: - TableViewCell Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Components
    public var titleLabel = UILabel()
    public var videoPreviewImage = UIImageView()
    public var descriptionLabel = UILabel()
    public var shareButton = UIButton()
}

// MARK: - Visual
extension InsightCustomVideoTableViewCell: LojongCustomView {
    func style() {
        // titleLabel
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width - 20, height: .greatestFiniteMagnitude))
        self.titleLabel.numberOfLines = 1
        // descriptionLabel
        self.descriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width - 120, height: .greatestFiniteMagnitude))
        self.descriptionLabel.numberOfLines = 3
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 12)
        self.descriptionLabel.text = "alkdlaksdj"
        
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //        // titleLabel
        //        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //        self.addSubview(titleLabel)
        //        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        //        self.titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        //
        //        // videoPreviewImage
        //        self.videoPreviewImage.translatesAutoresizingMaskIntoConstraints = false
        //        self.addSubview(videoPreviewImage)
        //        self.videoPreviewImage.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        //        self.videoPreviewImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //
        //        // descriptionLabel
        //        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        //        self.addSubview(descriptionLabel)
        //        self.descriptionLabel.topAnchor.constraint(equalTo: self.videoPreviewImage.bottomAnchor, constant: 10).isActive = true
        //        self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //
        //        // shareButton
        //        self.shareButton.translatesAutoresizingMaskIntoConstraints = false
        //        self.addSubview(shareButton)
        //        self.shareButton.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 10).isActive = true
        //        self.shareButton.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 10).isActive = true
        //        self.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //
        
        
        
        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|", options: <#T##NSLayoutConstraint.FormatOptions#>, metrics: <#T##[String : Any]?#>, views: <#T##[String : Any]#>)
        
    }
}
