//
//  InsightQuoteModel.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 23/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightQuote {
    var id: Int
    var text: String
    var order: Int
    
    var background: String
    var colorFont: UIColor
    
    var author: String
    
    init(id: Int, text: String, order: Int, background: String, colorFont: UIColor, author: String) {
        self.id = id
        self.text = text
        self.order = order
        
        self.background = background
        self.colorFont = colorFont
        
        self.author = author
    }
    
}
