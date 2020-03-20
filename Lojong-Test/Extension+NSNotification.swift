//
//  Extension+NSNotification.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 16/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

extension NSNotification.Name{
    public static let LojongChangeToVideoViewController = NSNotification.Name("com.tribuzy.Lojong-Test.lojongChangeToVideoViewController")
    public static let LojongChangeToArticlesViewController = NSNotification.Name("com.tribuzy.Lojong-Test.lojongChangeToArticleViewController")
    public static let LojongChangeToQuotesViewController = NSNotification.Name("com.tribuzy.Lojong-Test.lojongChangeToQuotesViewController")
    public static let LojongVideoPreviewImageDownloaded = NSNotification.Name("com.tribuzy.Lojong-Test.lojongVideosPreviewImageDownloaded")
    public static let LojongVideosChanged = NSNotification.Name("com.tribuzy.Lojong-Test.lojongVideosChanged")
}
