//
//  InsightCustomSegmentedControlView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 16/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightCustomSegmentedControlView: UIControl, LojongCustomView {
        
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
        ///List of buttons in SegmentedControl
        let commaSeparatedButtonTitles: String = "\(NSLocalizedString(" VÍDEOS", comment: "")),\(NSLocalizedString("ARTIGOS", comment: "")),\(NSLocalizedString("CITAÇÕES ", comment: ""))"
        
        var titleButtons: [UIButton] = [UIButton]()
        var titleButtonsStackView: UIStackView = UIStackView()
        var segmentedControlSelector = UIView()
        let selectedColor: UIColor = UIColor.init(red: 199, green: 128, blue: 128)
        let unselectedColor: UIColor = .white
        
        func style() {
            // Segmented Control
            self.backgroundColor = UIColor.init(red: 199, green: 128, blue: 128)
            self.layer.borderColor = UIColor.init(red: 199, green: 128, blue: 128).cgColor
            self.layer.borderWidth = 4.0
            
            self.clipsToBounds = true
            self.layer.cornerRadius = 22.5
            
            // Segmented Control Selector
            titleButtons[0].setTitleColor(selectedColor, for: .normal)
            
            let selectorWidht: CGFloat = 360 / CGFloat(titleButtons.count)
            let selectorHeight: CGFloat = 37
            segmentedControlSelector = UIView(frame: CGRect(x: 0, y: 4, width: selectorWidht, height: selectorHeight))
            
            segmentedControlSelector.backgroundColor = .white
            segmentedControlSelector.layer.cornerRadius = selectorHeight / 2
            
            addSubview(segmentedControlSelector)
        
        }
        
        func autolayout() {
            self.translatesAutoresizingMaskIntoConstraints = false
            
            // Buttons StackView
            self.addSubview(titleButtonsStackView)
            titleButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
            titleButtonsStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            titleButtonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            titleButtonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            titleButtonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        }
        
        // MARK: - Segmented Control Buttons
        /// Add a UIButton for each title separated by comma
        private func setTitleButtons(){
            titleButtons.removeAll()
            subviews.forEach{ $0.removeFromSuperview() }
            
            let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
            
            for buttonTitle in buttonTitles{
               let button = UIButton(type: .system)
               button.setTitle(buttonTitle, for: .normal)
               button.titleLabel?.font = UIFont(name: "Asap-Bold", size: 15)
               button.setTitleColor(unselectedColor, for: .normal)
               button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
               titleButtons.append(button)
            }
            
            setupStackView()
            
        }
        
        @objc
        private func buttonTapped(button: UIButton){
            for (buttonIndex, tappedButton) in titleButtons.enumerated() {
                tappedButton.setTitleColor(unselectedColor, for: .normal)
                
                if(tappedButton == button){
                    let selectedStartPosition: CGFloat = 360 / CGFloat(titleButtons.count) * CGFloat(buttonIndex)
                    UIView.animate(withDuration: 0.2) {
                        self.segmentedControlSelector.frame.origin.x = selectedStartPosition
                    }
                    tappedButton.setTitleColor(selectedColor, for: .normal)
                    
                    switch buttonIndex {
                    case 0:
                        NotificationCenter.default.post(name: .LojongChangeToVideoViewController, object: nil)
                    case 1:
                        NotificationCenter.default.post(name: .LojongChangeToArticlesViewController, object: nil)
                    case 2:
                        NotificationCenter.default.post(name: .LojongChangeToQuotesViewController, object: nil)
                    default:
                        break
                    }
                }

            }
            
        }
        
        private func setupStackView(){
            titleButtonsStackView = UIStackView(arrangedSubviews: titleButtons)
            titleButtonsStackView.axis = .horizontal
            titleButtonsStackView.alignment = .fill
            titleButtonsStackView.distribution = .fillEqually
        }
        
        
        
    }
