//
//  LojongDataController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 19/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightVideoModelController {
    public static let shared = InsightVideoModelController()
    
    public var insightVideos: [InsightVideo]
    
    public var clickedVideoURL: URL? = URL(string: "")
    
    private init() {
        self.insightVideos = []
    }
    
    public func downloadVideo(){
            var request = URLRequest(url: URL(string: "https://devlojong.com/api/videos")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("Bearer test", forHTTPHeaderField: "Authorization")

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                
            
                do{
                    let video = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [NSDictionary]
                    
                    
                    
                    for cachedVideo in video{
                        
                        let insightContentVideo: InsightVideo = InsightVideo.init(id: cachedVideo.value(forKey: "id") as! Int,
                                                                           name: cachedVideo.value(forKey: "name") as? String ?? "",
                                                                           description: cachedVideo.value(forKey: "description") as? String ?? "",
                                                                           file: cachedVideo.value(forKey: "file") as? String ?? "",
                                                                           url: cachedVideo.value(forKey: "url") as? String ?? "",
                                                                           url2: cachedVideo.value(forKey: "url2") as? String ?? "",
                                                                           aws_url: cachedVideo.value(forKey: "aws_url") as? String ?? "Bla",
                                                                           image: cachedVideo.value(forKey: "image") as? String ?? "",
                                                                           image_url: cachedVideo.value(forKey: "image_url") as? String ?? "Bla",
                                                                           premium: cachedVideo.value(forKey: "premium") as! Int,
                                                                           order: cachedVideo.value(forKey: "order") as! Int)
                        
                        
                        
                        DispatchQueue.main.async {
                            self.insightVideos.append(insightContentVideo)
                            DispatchQueue.main.async {
                                NotificationCenter.default.post(name: .LojongVideosChanged, object: nil)
                            }
                        }
                        
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
}
