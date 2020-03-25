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
        self.quoteBackgroundImageView.clipsToBounds = true
        self.quoteBackgroundImageView.layer.cornerRadius = 10
        
        // quoteContent
        self.quoteContent.backgroundColor = .clear
        
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
        self.bottomAppSite.font = UIFont(name: "Asap-Bold", size: 15.5)
        self.bottomAppSite.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.bottomAppSite.textAlignment = .center
        self.bottomAppSite.sizeToFit()
        self.bottomAppSite.text = "lojongapp.com"
        
        // descriptionLabel
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 15.5)
        self.descriptionLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.sizeToFit()
        self.descriptionLabel.text = ""
        
        // authorLabel
        self.authorLabel.numberOfLines = 0
        self.authorLabel.lineBreakMode = .byWordWrapping
        self.authorLabel.font = UIFont(name: "Asap-Regular", size: 15.5)
        self.authorLabel.textColor = UIColor.init(red: 128, green: 132, blue: 143)
        self.authorLabel.textAlignment = .center
        
        // shareButtom
        self.shareButton.backgroundColor = .clear
        self.shareLabel.text = NSLocalizedString("Compartilhar", comment: "")
        self.shareLabel.font = UIFont(name: "Asap-Bold", size: 15)
        self.shareLabel.textColor = .white
        self.shareIcon.image = UIImage(named: "share-white")
        self.buttomBackgroundView.backgroundColor = .white
        self.buttomBackgroundView.alpha = 0.25
        self.buttomBackgroundView.layer.cornerRadius = 5
    }
    
    func autolayout() {
        self.contentView.top(0.0).left(0.0).right(0.0).bottom(0.0)
        
        self.contentView.sv(quoteBackgroundImageView.sv(quoteContent.sv(topFirstSeparatorLine,
                                                                        topSecondSeparatorLine,
                                                                        topAppLogo,
                                                                        descriptionContent.sv(descriptionLabel,
                                                                                              authorLabel),
                                                                        bottomFirstSeparatorLine,
                                                                        bottomSecondSeparatorLine,
                                                                        bottomAppSite),
                                                        shareButton.sv(buttomBackgroundView,shareIcon, shareLabel)))
        
        self.contentView.layout(8,
                                quoteBackgroundImageView.right(10).left(10),
                                0)
        
        quoteBackgroundImageView.top(10).right(10).bottom(10).left(10).height(365)
        
        quoteContent.top(18).right(0).bottom(50).left(0)
        
        align(horizontally: |-20-topFirstSeparatorLine-12-topAppLogo-12-topSecondSeparatorLine-20-|)
        topFirstSeparatorLine.height(1)
        topSecondSeparatorLine.height(1)
        topAppLogo.width(25).top(0).centerHorizontally()
        
        align(horizontally: |-20-bottomFirstSeparatorLine-12-bottomAppSite-12-bottomSecondSeparatorLine-20-|)
        bottomFirstSeparatorLine.height(1)
        bottomSecondSeparatorLine.height(1)
        bottomAppSite.centerHorizontally().bottom(0)

        descriptionContent.centerVertically().right(10).left(10)
        descriptionContent.layout(0,
                                  descriptionLabel.right(10).left(10),
                                  10,
                                  authorLabel.right(40).left(40),
                                  0)

        self.shareButton.layout(|-15-shareIcon.width(12).height(14)-shareLabel-15-|)
        self.shareLabel.top(0).bottom(0).centerVertically()
        self.shareButton.bottom(10).height(30).centerHorizontally()
        buttomBackgroundView.top(0).right(0).bottom(0).left(0)
    }
}
