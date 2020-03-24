//
//  InsightQuoteTableViewCellStyle.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

extension InsightQuoteTableViewCell: LojongCustomView{
    func style() {
        self.contentView.backgroundColor = .white
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        // quoteBackgroundImageView
        self.quoteBackgroundImageView.contentMode = .scaleToFill
        self.clipsToBounds = true
        
        // descriptionLabel
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 15.5)
        self.descriptionLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.text = "$get small article text description from api. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis felis neque."
    }
    
    func autolayout() {
        self.contentView.top(0.0).left(0.0).right(0.0).bottom(0.0)
        
        self.contentView.sv(quoteBackgroundImageView.sv(descriptionLabel))
        
        self.contentView.layout(10,
                                quoteBackgroundImageView.right(10).left(10).layout(descriptionLabel.centerInContainer().right(10).left(10)),
                                10)
        
        quoteBackgroundImageView.top(10).right(10).bottom(10).left(10).height(365)
    }
}
