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
        self.style()
        self.autolayout()
        
        buttom.addTarget(self, action: #selector(dismissFundamentViewController), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let buttom: UIButton = UIButton()
}

extension FundamentsView: LojongCustomView{
    func style() {
        self.backgroundColor = .white
        
        buttom.backgroundColor = .cyan
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
        
        sv(buttom)
        buttom.width(50).height(50).centerInContainer()
    }
    
    @objc private func dismissFundamentViewController(){

        NotificationCenter.default.post(name: .LojongDismissFundamentViewController, object: nil)
    }
}
