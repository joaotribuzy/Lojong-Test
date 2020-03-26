//
//  FundamentsViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 25/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class FundamentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = FundamentsView()
        
        self.modalPresentationStyle = .custom
    }
    
}
