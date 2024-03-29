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
    public static let LojongPlayVideoOnController = NSNotification.Name("com.tribuzy.Lojong-Test.lojongPlayVideoOnController")
    public static let LojongInsightArticleImageDownloaded = NSNotification.Name("com.tribuzy.Lojong-Test.lojongInsightArticleImageDownloaded")
    public static let LojongArticlesChanged = NSNotification.Name("com.tribuzy.Lojong-Test.lojongArticlesChanged")
    public static let LojongQuotesChanged = NSNotification.Name("com.tribuzy.Lojong-Test.lojongQuotesChanged")
    public static let LojongShareQuoteImage = NSNotification.Name("com.tribuzy.Lojong-Test.lojongShareQuoteImage")
    public static let LojongDismissFundamentViewController = NSNotification.Name("com.tribuzy.Lojong-Test.lojongDismissFundamentViewController")
}
