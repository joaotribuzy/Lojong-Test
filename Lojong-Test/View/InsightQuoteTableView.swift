//
//  InsightQuoteTableView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class InsightQuoteTableView: UITableView{
    
    // MARK: - TableView Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
}

extension InsightQuoteTableView: LojongCustomView{
    func style() {
        self.backgroundColor = .white
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
    }
}
