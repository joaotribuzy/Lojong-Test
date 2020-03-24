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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    // MARK: - Components
    
    public var quote: InsightQuote? = nil
    
    public var quoteBackgroundImageView: UIImageView = UIImageView()
    
    public var topFirstSeparatorLine: UIView = UIView()
    public var topsecondSeparator: UIView = UIView()
    public var topAppLogo: UIImageView = UIImageView()
    
    public var descriptionLabel: UILabel = UILabel()
    
    public var bottomFirstSeparatorLine: UIView = UIView()
    public var bottomSecondSeparatorLine: UIView = UIView()
    public var bottomAppSite: UILabel = UILabel()
    
    public var shareLabel: UILabel = UILabel()
    public var shareIcon: UIImageView = UIImageView()
    
}

extension InsightQuoteTableViewCell{
    
    public func fill(_ quote: InsightQuote){
        
        self.quote = quote
        
        self.quoteBackgroundImageView.image = UIImage(named: self.quote!.background)
        
        self.descriptionLabel.text = self.quote?.text
        self.descriptionLabel.textColor = self.quote?.colorFont
        
    }
    
}
