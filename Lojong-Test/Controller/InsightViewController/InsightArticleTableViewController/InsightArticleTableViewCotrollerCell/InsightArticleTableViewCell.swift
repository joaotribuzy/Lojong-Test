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
        
        self.setupNotification()
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private var article: InsightArticle? = nil
    
    public var titleLabel: UILabel = UILabel()
    public var articleImageView: UIImageView = UIImageView()
    public var descriptionLabel: UILabel = UILabel()
    public var shareButton = UIButton()
    public var separatorLine = UIView()
    
    public var shareLabel: UILabel = UILabel()
    public var shareIcon: UIImageView = UIImageView()
}

extension InsightArticleTableViewCell{
    
    public func fill(_ article: InsightArticle){
        
        self.article = article
        
        self.titleLabel.text = article.title.uppercased()
        
        self.articleImageView.image = article.articleImage
        
        self.descriptionLabel.text = article.text
    }
    
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(endpointDownloadedArticleImageReceived(_:)), name: .LojongInsightArticleImageDownloaded, object: article)
    }
    
    @objc private func endpointDownloadedArticleImageReceived(_ notification: Notification) {
        DispatchQueue.main.async {
            self.articleImageView.image = self.article?.articleImage
        }
    }
}
