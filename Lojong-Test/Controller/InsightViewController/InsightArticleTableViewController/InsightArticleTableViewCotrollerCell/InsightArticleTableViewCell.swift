//
//  InsightArticleTableViewCell.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 21/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightArticleTableViewCell: UITableViewCell {
    
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
    
    public var titleLabel: UILabel = UILabel()
    public var articleImageView: UIImageView = UIImageView()
    public var descriptionLabel: UILabel = UILabel()
    public var shareButton = UIButton()
    public var separatorLine = UIView()
    
    public var shareLabel: UILabel = UILabel()
    public var shareIcon: UIImageView = UIImageView()
}
