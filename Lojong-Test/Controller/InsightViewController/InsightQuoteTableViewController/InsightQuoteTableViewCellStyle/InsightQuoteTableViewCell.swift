//
//  InsightQuoteTableViewCell.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 23/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightQuoteTableViewCell: UITableViewCell{
    
    // MARK: - TableViewCell Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.style()
        self.autolayout()
        
        shareButton.addTarget(self, action:#selector(shareImage), for: .touchUpInside)
        setupImageViewTouch()
        
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
    
    public var shareButton: UIButton = UIButton()
    public var shareLabel: UILabel = UILabel()
    public var shareIcon: UIImageView = UIImageView()
    public var buttomBackgroundView: UIView = UIView()
    
}

extension InsightQuoteTableViewCell{
    
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
    
    func setupImageViewTouch(){
        self.shareButton.isUserInteractionEnabled = true
        self.shareButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shareImage)))
    }
    
    @objc private func shareImage(){
        self.shareButton.isHidden = true
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.quoteBackgroundImageView.frame.size.width, height: self.quoteBackgroundImageView.frame.size.height - 18), false, 0)
        self.quoteBackgroundImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        imageToShare = image
        
        self.shareButton.isHidden = false
        
        NotificationCenter.default.post(name: .LojongShareQuoteImage, object: nil)
    }
    
}
