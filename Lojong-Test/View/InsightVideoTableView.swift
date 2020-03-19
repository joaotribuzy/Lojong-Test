//
//  InsightVideoTableView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class InsightVideoTableView: UITableView{
    
    // MARK: - TableView Lifecycle
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.style()
        self.autolayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var indicator = UIActivityIndicatorView()

}

extension InsightVideoTableView: LojongCustomView {
    
    // MARK: - Visual
    func style() {
        self.backgroundColor = .clear
        
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // Load indicator
        
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.top(0.0).left(0.0).right(0.0).bottom(100)
    }
    
}
