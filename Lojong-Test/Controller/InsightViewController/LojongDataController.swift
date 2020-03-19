//
//  LojongDataController.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 19/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class LojongVideoDataController {
    public static let shared = LojongVideoDataController()
    
    public var insightVideos: [InsightVideo]
    
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
                        let insightVideo: InsightVideo = InsightVideo.init(id: cachedVideo.value(forKey: "id") as! Int,
                                                                           name: cachedVideo.value(forKey: "name") as? String ?? "Bla",
                                                                           description: cachedVideo.value(forKey: "description") as? String ?? "Bla",
                                                                           file: cachedVideo.value(forKey: "file") as? String ?? "",
                                                                           url: cachedVideo.value(forKey: "url") as? String ?? "Bla",
                                                                           url2: cachedVideo.value(forKey: "url2") as? String ?? "Bla",
                                                                           aws_url: cachedVideo.value(forKey: "aws_url") as? String ?? "Bla",
                                                                           image: cachedVideo.value(forKey: "image") as? String ?? "Bla",
                                                                           image_url: cachedVideo.value(forKey: "image_url") as? String ?? "Bla",
                                                                           premium: cachedVideo.value(forKey: "premium") as! Int,
                                                                           order: cachedVideo.value(forKey: "order") as! Int)
                        
                        self.insightVideos.append(insightVideo)
                    }
                    
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .LojongDataVideosDownloaded, object: nil)
                    }
                    
                } catch {
                    print(error)
                }
            }.resume()
        }
}
