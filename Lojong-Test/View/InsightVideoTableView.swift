//
//  InsightVideoTableView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

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
}

extension InsightVideoTableView: LojongCustomView {
    
    // MARK: - Visual
    func style() {
        self.backgroundColor = .clear
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = self.layoutMarginsGuide
        
        self.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
}
