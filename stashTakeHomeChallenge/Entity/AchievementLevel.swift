//
//  AchievementLevel.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation

struct AchievementService: Decodable {
    let status: Int
    let overview: [String: String]
    let achievements: [Achievement]
}

struct Achievement : Decodable{
    let id : Int
    let level : Int
    let progress : Float
    let total : Float
    let imgURL : URL
    let accessibility : Bool
}

extension Achievement {
    init?(_ dictionary : [String : Any]) {
        guard let id = dictionary["id"] as? Int ,let level = dictionary["level"] as? String ,let progress = dictionary["progress"] as? Float, let total = dictionary["total"] as? Float, let bgImg = dictionary["bg_image_url"] as? String ,let accessible = dictionary["accessible"] as? Bool else {
            
            return nil
        }
        self.id = id
        self.level = Int(level)!
        self.progress = progress
        self.total = total
        self.imgURL = URL(string: bgImg)!
        self.accessibility = accessible
        
    }
    
}
