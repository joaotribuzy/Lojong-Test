//
//  InsightView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightView: UIView, LojongCustomView {
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style
    func style() {
        self.backgroundColor = .green
    }
    
    func autolayout() {
        self.layoutMargins = .zero
    }
    
    
}
