//
//  FundamentsView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 25/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class FundamentsView: UIView{
    
    // MARK: - View Lifecycle
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
}

extension FundamentsView: LojongCustomView{
    func style() {
        self.backgroundColor = .white
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
    }
}
