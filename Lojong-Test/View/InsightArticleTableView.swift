//
//  InsightArticleTableView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 21/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightArticleTableView: UITableView, LojongCustomView{
    
    // MARK: - TableView Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InsightArticleTableView{
    // MARK: - Visual
    func style(){
        self.backgroundColor = .white
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
    }
}
