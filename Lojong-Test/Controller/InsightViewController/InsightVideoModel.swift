//
//  InsightVideoModel.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 19/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class InsightVideo: Codable {
    var id: Int
    var name: String
    var description: String
    var file: String
    var url: String
    var url2: String
    var aws_url: String
    var image: String
    var image_url: String
    var premium: Int
    var order: Int
    
    init(id: Int, name: String, description: String, file: String, url: String, url2: String, aws_url: String, image: String, image_url: String, premium: Int, order: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.file = file
        self.url = url
        self.url2 = url2
        self.aws_url = aws_url
        self.image = image
        self.image_url = image_url
        self.premium = premium
        self.order = order
    }
}
