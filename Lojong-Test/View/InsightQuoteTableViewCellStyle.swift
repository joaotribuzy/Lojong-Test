//
//  InsightQuoteTableViewCellStyle.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension InsightQuoteTableViewCell: LojongCustomView{
    func style() {
        self.contentView.backgroundColor = .white
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        // quoteBackgroundImageView
        self.quoteBackgroundImageView.contentMode = .scaleToFill
        self.clipsToBounds = true
        
        // topFirstSeparatorLine
        self.topFirstSeparatorLine.backgroundColor = self.quote?.colorFont
        
        // topSecondSeparatorLine
        self.topSecondSeparatorLine.backgroundColor = self.quote?.colorFont
        
        // topAppLogo
        self.topAppLogo.contentMode = .scaleAspectFit
        self.clipsToBounds = true
        
        // topFirstSeparatorLine
        self.bottomFirstSeparatorLine.backgroundColor = self.quote?.colorFont
        
        // topSecondSeparatorLine
        self.bottomSecondSeparatorLine.backgroundColor = self.quote?.colorFont
        
        // topAppLogo
        self.bottomAppSite.numberOfLines = 0
        self.bottomAppSite.lineBreakMode = .byWordWrapping
        self.bottomAppSite.font = UIFont(name: "Asap-Bold", size: 16)
        self.bottomAppSite.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.bottomAppSite.textAlignment = .center
        self.bottomAppSite.sizeToFit()
        self.bottomAppSite.text = "lojongapp.com"
        
        // descriptionLabel
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 16)
        self.descriptionLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.sizeToFit()
        self.descriptionLabel.text = ""
        
        // authorLabel
        self.authorLabel.numberOfLines = 0
        self.authorLabel.lineBreakMode = .byWordWrapping
        self.authorLabel.font = UIFont(name: "Asap-Regular", size: 17)
        self.authorLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.authorLabel.textAlignment = .center
        
        // shareButtom
        self.shareButton.backgroundColor = UIColor.init(red: 236, green: 236, blue: 236)
        self.shareButton.layer.cornerRadius = 15
        self.shareLabel.text = NSLocalizedString("Compartilhar", comment: "")
        self.shareLabel.font = UIFont(name: "Asap-Bold", size: 15)
        self.shareLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.shareIcon.image = UIImage(named: "share")
    }
    
    func autolayout() {
        self.contentView.top(0.0).left(0.0).right(0.0).bottom(0.0)
        
        self.contentView.sv(quoteBackgroundImageView.sv(topFirstSeparatorLine,
                                                        topSecondSeparatorLine,
                                                        topAppLogo,
                                                        descriptionLabel,
                                                        authorLabel,
                                                        bottomFirstSeparatorLine,
                                                        bottomSecondSeparatorLine,
                                                        bottomAppSite))
        
        self.contentView.layout(10,
                                quoteBackgroundImageView.right(10).left(10),
                                10)
        
        quoteBackgroundImageView.top(10).right(10).bottom(10).left(10).height(365)
        
        align(horizontally: |-20-topFirstSeparatorLine-12-topAppLogo-12-topSecondSeparatorLine-20-|)
        topFirstSeparatorLine.height(1).top(35)
        topSecondSeparatorLine.height(1).top(35)
        topAppLogo.width(35).centerHorizontally()
        
        descriptionLabel.centerVertically().right(10).left(10)
        authorLabel.centerHorizontally()
    
        authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        
        
        align(horizontally: |-20-bottomFirstSeparatorLine-12-bottomAppSite-12-bottomSecondSeparatorLine-20-|)
        bottomFirstSeparatorLine.height(1).bottom(35)
        bottomSecondSeparatorLine.height(1).bottom(35)
        bottomAppSite.centerHorizontally()
    }
}
