//
//  InsightQuoteModelController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 23/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightQuoteModelController {
    public static let shared = InsightQuoteModelController()
    
    public var insightQuotes: [InsightQuote]
    
    private init() {
        self.insightQuotes = []
    }
    
    public func downloadQuote(){
        var request = URLRequest(url: URL(string: "https://devlojong.com/api/quotes")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer test", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do{
                let quote = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Array<[String:Any]>
                
                let colorFont = ["blueCard" : UIColor.init(red: 68, green: 109, blue: 175),
                                 "yellowCard" : UIColor.init(red: 108, green: 95, blue: 76),
                                 "redCard" : UIColor.init(red: 255, green: 255, blue: 255)]
                
                let card = ["blueCard" : "Quote-1",
                            "yellowCard" : "Quote-2",
                            "redCard" : "Quote-3"]
                
                let logo = ["blueCard" : "logoBlue",
                            "yellowCard" : "logoYellow",
                            "redCard" : "logoRed"]
                
                var colorToSet: UIColor = colorFont["redCard"]!
                var cardToSet: String = card["redCard"]!
                var logoToSet: String = logo["redCard"]!
                
                for cachedQuote in quote{
                    
                    switch colorToSet {
                        case colorFont["blueCard"]:
                            colorToSet = colorFont["yellowCard"]!
                            cardToSet = card["yellowCard"]!
                            logoToSet = logo["yellowCard"]!
                        case colorFont["yellowCard"]:
                            colorToSet = colorFont["redCard"]!
                            cardToSet = card["redCard"]!
                            logoToSet = logo["redCard"]!
                        case colorFont["redCard"]:
                            colorToSet = colorFont["blueCard"]!
                            cardToSet = card["blueCard"]!
                            logoToSet = logo["blueCard"]!
                    default:
                        break
                    }
                    
                    let contentText: [String] = (cachedQuote["text"] as! String).components(separatedBy: "&nbsp;&ndash;&nbsp;")
                    
                    let insightContentQuote: InsightQuote = InsightQuote.init(id: cachedQuote["id"] as! Int,
                                                                              text: contentText[0],
                                                                              order: cachedQuote["order"] as! Int,
                                                                              background: cardToSet,
                                                                              colorFont: colorToSet,
                                                                              author: contentText[1],
                                                                              lojongLogo: logoToSet)
                    
                    self.insightQuotes.append(insightContentQuote)
                    NotificationCenter.default.post(name: .LojongQuotesChanged, object: nil)

                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
