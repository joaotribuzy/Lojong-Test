//
//  LojongArticleModel.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightArticle {
    var id: Int
    var text: String
    var image_url: URL
    var author_name: String
    var url: URL
    var premium: Int
    var order: Int
    var image: URL
    
    init(id: Int, text: String, image_url: URL, author_name: String, url: URL, premium: Int, order: Int, image: URL) {
        self.id = id
        self.text = text
        self.image_url = image_url
        self.author_name = author_name
        self.url = url
        self.premium = premium
        self.order = order
        self.image = image
    }
    
    
}
