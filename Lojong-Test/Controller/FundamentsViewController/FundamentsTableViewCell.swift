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
    let progressView: UIView = UIView()
    
    let titleLabel: UILabel = UILabel()
    let timeLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
}

extension FundamentsTableViewCell: LojongCustomView{
    
    // MARK: - Visual
    
    func style() {
        self.backgroundColor = .white
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        // iconImage
        iconImage.backgroundColor = .systemPink
        
        // progressView
        progressView.backgroundColor = .blue
        
        // titleLabel
        titleLabel.text = "Fundamentos"
        titleLabel.font = UIFont(name: "Asap-Bold", size: 15)
        titleLabel.textColor = .gray
        
        // timeLabel
        timeLabel.text = "31 Dias • PROGRAMA"
        timeLabel.font = UIFont(name: "Asap-Regular", size: 11)
        timeLabel.textColor = .gray
        
        // descriptionLabel
        descriptionLabel.text = "Introdução teórica e prática a meditação."
        descriptionLabel.font = UIFont(name: "Asap-Regular", size: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textColor = .gray
    }
    
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
        
        sv(iconImage, progressView, titleLabel, timeLabel, descriptionLabel)
        
        iconImage.height(60).width(60).left(20).top(10).bottom(17)
        progressView.height(5).width(60).bottom(10).left(20)
        
        titleLabel.left(90).top(10)
        
        timeLabel.left(90).top(30)
        
        descriptionLabel.left(90).right(100).bottom(10)
    }
}
