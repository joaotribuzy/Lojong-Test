//
//  InsightArticleTableViewCellStyle.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 21/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension InsightArticleTableViewCell: LojongCustomView{
    func style() {
        // cellContentView
        self.contentView.backgroundColor = .white
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        // titleLabel
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont(name: "Asap-Bold", size: 15)
        self.titleLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        
        
        // videoPreviewImage
        self.articleImageView.backgroundColor = .gray
        self.articleImageView.layer.cornerRadius = 5
        
        // descriptionLabel
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.font = UIFont(name: "Asap-Regular", size: 13)
        self.descriptionLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.text = "$get small article text description from api. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis felis neque."
        
        // shareButton
        self.shareButton.backgroundColor = UIColor.init(red: 236, green: 236, blue: 236)
        self.shareButton.layer.cornerRadius = 15
        self.shareLabel.text = NSLocalizedString("Compartilhar", comment: "")
        self.shareLabel.font = UIFont(name: "Asap-Bold", size: 15)
        self.shareLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.shareIcon.image = UIImage(named: "share")
        
        // separatorLine
        self.separatorLine.backgroundColor = UIColor.init(red: 236, green: 236, blue: 236)
    }
    
    func autolayout() {
        self.contentView.top(0.0).left(0.0).right(0.0).bottom(0.0)
        self.contentView.sv(titleLabel,
                            articleImageView,
                            descriptionLabel,
                            shareButton.sv(shareIcon,
                                           shareLabel),
                            separatorLine)
        
        
        self.contentView.layout(10,
                                titleLabel.centerHorizontally(),
                                10,
                                articleImageView.left(10).right(10).centerHorizontally(),
                                10,
                                descriptionLabel.left(40).right(40),
                                10,
                                shareButton.height(30).centerHorizontally(),
                                10,
                                separatorLine.right(10).left(10).height(1).bottom(0))
        
        self.articleImageView.Height == 56.25 % articleImageView.Width
        
        self.shareLabel.centerVertically()
        
        self.shareButton.layout(|-15-shareIcon.width(12).height(14)-shareLabel-15-|)
    }
}
