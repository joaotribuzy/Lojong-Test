//
//  InsightCustomSegmentedControlViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 16/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightCustomSegmentedControlViewController: UIViewController {
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = InsightCustomSegmentedControlView()
    }
    
}
