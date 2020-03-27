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
        
        
        scrollToEnd()
        
        backButtom.addTarget(self, action: #selector(dismissFundamentViewController), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let topView: UIView = UIView()
    let backButtom: UIButton = UIButton()
    let fundamentLabel: UILabel = UILabel()
    
    let scrollView: UIScrollView = UIScrollView()
    let imageBackGround: UIImageView = UIImageView()
    
    var listViewClick: [UIImageView] = []
}

extension FundamentsView: LojongCustomView{
    func style() {
        self.backgroundColor = UIColor.init(red: 101, green: 163, blue: 126)
        
        // backButtom
        backButtom.setImage(UIImage(named: "back-buttom"), for: .normal)
        
        // fundamentLabel
        fundamentLabel.text = String("fundamentos").uppercased()
        fundamentLabel.font = UIFont(name: "Asap-Bold", size: 20)
        fundamentLabel.textColor = .white
        
        // topView
        topView.backgroundColor = UIColor.init(red: 118, green: 189, blue: 148)
        topView.dropShadow()
        
        // scrollView
        scrollView.backgroundColor = UIColor.init(red: 155, green: 218, blue: 94)
        scrollView.bounces = false
        
        // imageViewBackGround
        imageBackGround.contentMode = .scaleAspectFit
        imageBackGround.image = UIImage(named: "fundaments")
        
        // listViewClick
        for current in 0...30 {
            let view: UIImageView = UIImageView()
            view.backgroundColor = .clear
            
            let dayLabel: UILabel = UILabel()
            dayLabel.text = "Dia \(current + 1)"
            dayLabel.font = UIFont(name: "Asap-Regular", size: 11)
            dayLabel.textColor = UIColor.init(red: 139, green: 87, blue: 41)
            
            view.sv(dayLabel)
            view.contentMode = .scaleAspectFit
            
            switch current {
            case 0,1,3:
                view.image = UIImage(named: "vertical-ground")
            case 2,4:
                view.image = UIImage(named: "horizontal-ground")
            default:
                break
            }
            
            listViewClick.append(view)
        }
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
        
        
        
        // topview
        sv(topView)
        topView.top(0).right(0).left(0).height(70)
        topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        
        // backButtom
        topView.sv(backButtom, fundamentLabel)
        backButtom.top(10).bottom(10).left(20)
        backButtom.Height == backButtom.Width
        
        fundamentLabel.centerInContainer()
        
        // scrollView
        sv(scrollView)
        scrollView.right(0).bottom(0).left(0)
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: (7371/640) * UIScreen.main.bounds.width)
        
        scrollView.sv(imageBackGround)
        imageBackGround.width(UIScreen.main.bounds.width).height((7371/640) * UIScreen.main.bounds.width)
        imageBackGround.Width == self.Width
        
        // listViewClick
        for current in 0...30{
        
            imageBackGround.sv(listViewClick[current])
            
            switch current {
            case 0:
                listViewClick[current].width(84.3).height(90).right(85.3)
                listViewClick[current].Bottom == 54
                listViewClick[current].subviews[0].centerHorizontally().bottom(28)
            case 1:
                listViewClick[current].width(84.3).height(90).right(85.3)
                listViewClick[current].Bottom == 175
                listViewClick[current].subviews[0].centerHorizontally().bottom(28)
            case 2:
                listViewClick[current].width(90).height(79.5).right(185)
                listViewClick[current].Bottom == 280
                listViewClick[current].subviews[0].centerHorizontally().bottom(28)
            case 3:
                listViewClick[current].width(84.3).height(90).left(40)
                listViewClick[current].Bottom == 367
                listViewClick[current].subviews[0].centerHorizontally().bottom(28)
            case 4:
                listViewClick[current].width(90).height(79.5).centerHorizontally()
                listViewClick[current].Bottom == 472
                listViewClick[current].subviews[0].centerHorizontally().bottom(28)
            default:
                break
            }
        
            
        
        }
    }
    
    @objc private func dismissFundamentViewController(){

        NotificationCenter.default.post(name: .LojongDismissFundamentViewController, object: nil)
    }
    
    func scrollToEnd(){
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
