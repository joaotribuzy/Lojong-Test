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
        
        self.autolayout()
        self.style()
        
        scrollToEnd()
        
        buttom.addTarget(self, action: #selector(dismissFundamentViewController), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let buttom: UIButton = UIButton()
    let scrollView: UIScrollView = UIScrollView()
    let imageBackGround: UIImageView = UIImageView()
}

extension FundamentsView: LojongCustomView{
    func style() {
        self.backgroundColor = .white
        
        buttom.backgroundColor = .cyan
        
        // scrollView
        scrollView.backgroundColor = UIColor.init(red: 155, green: 218, blue: 94)
        scrollView.bounces = false
        
        // imageViewBackGround
        imageBackGround.contentMode = .scaleAspectFit
        imageBackGround.image = UIImage(named: "fundaments")
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
        
        sv(buttom)
        buttom.width(50).height(50).top(20).left(0)
        
        sv(scrollView)
        scrollView.top(70).right(0).bottom(0).left(0)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: (7371/640) * UIScreen.main.bounds.width)
        
        scrollView.sv(imageBackGround)
        imageBackGround.width(UIScreen.main.bounds.width).height((7371/640) * UIScreen.main.bounds.width)
        imageBackGround.Width == self.Width
    }
    
    @objc private func dismissFundamentViewController(){

        NotificationCenter.default.post(name: .LojongDismissFundamentViewController, object: nil)
    }
    
    func scrollToEnd(){
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
