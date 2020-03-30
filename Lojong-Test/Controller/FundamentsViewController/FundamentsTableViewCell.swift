//
//  FundamentsTableViewCell.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 25/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class FundamentsTableViewCell: UITableViewCell{
    
    var model: FundamentModel = {
        return FundamentModel.shared
    }()
    
    // MARK: TableViewCell Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let iconImage: UIImageView = UIImageView()
    
    let titleLabel: UILabel = UILabel()
    let timeLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
}

