//
//  CustomAVPlayer.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 20/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import AVKit

class CustomAVPlayer: AVPlayerViewController {

    typealias DissmissBlock = () -> Void
    var onDismiss: DissmissBlock?

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed {
          onDismiss?()
        }
    }
    override func viewDidLoad() {
        exitsFullScreenWhenPlaybackEnds = true
    }
}
