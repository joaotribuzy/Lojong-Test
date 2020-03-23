//
//  InsightViewController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 15/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import AVKit

class InsightMainViewController: UIViewController {

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = InsightMainView()
        
        self.setupNotification()
    }
    
    var model: InsightVideoModelController = {
        return InsightVideoModelController.shared
    }()
    
    private var player: AVPlayer? = nil
    
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(alteringVideoURLNotificationReceived(_:)), name: .LojongPlayVideoOnController, object: nil)
    }

}

extension InsightMainViewController{
    private func playVideo(){
        guard let videoURL = self.model.clickedVideoURL else { return }
        self.player = AVPlayer(url: videoURL)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        }
        catch {
           print(error)
        }
        
        present(playerViewController, animated: true) {
            self.player?.play()
        }
    }
    
    @objc private func alteringVideoURLNotificationReceived(_ notification: Notification){
        self.playVideo()
        
    }
}
