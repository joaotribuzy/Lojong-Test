//
//  LojongArticleModelController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 22/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightArticleModelController{
    public static let shared = InsightArticleModelController()
    
    public var insightArticles: [InsightArticle]
    
    private init() {
        self.insightArticles = []
    }
    
    public func downloadArticle(){
        var request = URLRequest(url: URL(string: "https://devlojong.com/api/articles")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer test", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do{
                let article = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                
                let articles: Array<[String:Any]> = article["articles"] as! Array<[String:Any]>
                
                for cachedArticle in articles{
                    
                    let insightContentArticle: InsightArticle = InsightArticle.init(id: cachedArticle["id"] as! Int,
                                                                                    text: cachedArticle["text"] as? String ?? "",
                                                                                  title: cachedArticle["title"] as? String ?? "",
                                                                                  image_url: URL(string: cachedArticle["image_url"] as! String)!,
                                                                                  author_name: cachedArticle["author_name"] as? String ?? "",
                                                                                  url: URL(string: cachedArticle["image_url"] as! String)!,
                                                                                  premium: cachedArticle["premium"] as! Int,
                                                                                  order: cachedArticle["order"] as! Int,
                                                                                  image: URL(string: cachedArticle["image"] as! String)!)


                    
                    self.insightArticles.append(insightContentArticle)
                    self.insightArticles.sort(by: {$0.order < $1.order})
                    NotificationCenter.default.post(name: .LojongArticlesChanged, object: nil)

                    
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
