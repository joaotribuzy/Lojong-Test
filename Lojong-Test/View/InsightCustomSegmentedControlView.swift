//
//  InsightCustomSegmentedControlView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 16/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightCustomSegmentedControlView: UIView, LojongCustomView {
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.style()
        self.autolayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual
    
    func style() {
        self.backgroundColor = UIColor.init(red: 199, green: 128, blue: 128)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 22.5
    
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
