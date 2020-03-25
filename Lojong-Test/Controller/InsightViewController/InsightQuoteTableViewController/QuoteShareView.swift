//
//  QuoteShareView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 24/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class QuoteShareView: UIView{
    
    // MARK: - TableViewCell Lifecycle
    init(frame: CGRect, quote: InsightQuote) {
        super.init(frame: frame, quote: quote)
        self.quote = quote
        
        self.style()
        self.autolayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    // MARK: - Components
    
    public var quote: InsightQuote? = nil
    
    public var quoteBackgroundImageView: UIImageView = UIImageView()
    public var quoteContent: UIView = UIView()
    
    public var descriptionContent: UIView = UIView()
    
    public var topFirstSeparatorLine: UIView = UIView()
    public var topSecondSeparatorLine: UIView = UIView()
    public var topAppLogo: UIImageView = UIImageView()
    
    public var descriptionLabel: UILabel = UILabel()
    
    public var authorLabel: UILabel = UILabel()
    
    public var bottomFirstSeparatorLine: UIView = UIView()
    public var bottomSecondSeparatorLine: UIView = UIView()
    public var bottomAppSite: UILabel = UILabel()
    
    public var shareButton = UIButton()
    public var shareLabel: UILabel = UILabel()
    public var shareIcon: UIImageView = UIImageView()
    public var buttomBackgroundView: UIView = UIView()
    
    public func fill(_ quote: InsightQuote){
        
        self.quote = quote
        
        self.quoteBackgroundImageView.image = UIImage(named: self.quote!.background)
        
        self.descriptionLabel.text = self.quote?.text
        self.descriptionLabel.textColor = self.quote?.colorFont
        
        self.authorLabel.text = self.quote?.author
        self.authorLabel.textColor = self.quote?.colorFont
        
        self.topFirstSeparatorLine.backgroundColor = self.quote?.colorFont
        self.topSecondSeparatorLine.backgroundColor = self.quote?.colorFont
        
        self.topAppLogo.image = UIImage(named: self.quote!.lojongLogo)
        
        self.bottomAppSite.textColor = self.quote?.colorFont
        self.bottomFirstSeparatorLine.backgroundColor = self.quote?.colorFont
        self.bottomSecondSeparatorLine.backgroundColor = self.quote?.colorFont
        
        
        
        switch self.quote?.lojongLogo {
        case "logoBlue":
            self.buttomBackgroundView.alpha = 1
            self.buttomBackgroundView.backgroundColor = self.quote?.colorFont
        case "logoYellow":
            self.buttomBackgroundView.alpha = 0.25
            self.buttomBackgroundView.backgroundColor = .white
        case "logoRed":
            self.buttomBackgroundView.alpha = 0.25
            self.buttomBackgroundView.backgroundColor = .white
        default:
            break
        }
        
        if self.descriptionLabel.text!.count > 455 {
            self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 13)
        } else {
            self.descriptionLabel.font = UIFont(name: "Asap-Bold", size: 15.5)
        }
        
    }
}
