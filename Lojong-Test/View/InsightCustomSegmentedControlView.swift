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
        
        self.setTitleButtons()
        
        self.style()
        self.autolayout()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Visual
    let commaSeparatedButtonTitles: String = "Vai,Top"
    
    var titleButtons: [UIButton] = [UIButton]()
    var titleButtonsStackView: UIStackView = UIStackView()
    
    func style() {
        self.backgroundColor = UIColor.init(red: 199, green: 128, blue: 128)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 22.5
    
    }
    
    func autolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Buttons StackView
    }
    
    // MARK: - Segmented Control Buttons
    private func setTitleButtons(){
        titleButtons.removeAll()
        subviews.forEach{ $0.removeFromSuperview() }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            titleButtons.append(button)
        }
        
        titleButtonsStackView = UIStackView(arrangedSubviews: titleButtons)
        titleButtonsStackView.axis = .horizontal
        titleButtonsStackView.alignment = .fill
        titleButtonsStackView.distribution = .fillEqually
        self.addSubview(titleButtonsStackView)
        titleButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        titleButtonsStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleButtonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleButtonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleButtonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
    }
    
}
