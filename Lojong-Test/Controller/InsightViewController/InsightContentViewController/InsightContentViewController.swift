//
//  InsightContentViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 16/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class InsightContentViewController: UIViewController {
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotification()
        
        self.view = InsightContentView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(shareImageNotificationReceived(_:)), name: .LojongShareQuoteImage, object: nil)
    }
  
    @objc private func shareImageNotificationReceived(_ notification: Notification){
        let image = imageToShare
        let imageShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
