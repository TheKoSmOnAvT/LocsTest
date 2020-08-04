//
//  EventShortInfo.swift
//  LocsApp
//
//  Created by Никита Попов on 04.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

public struct  EventshortInfo : Decodable {
    let  id : Int
    let  name : String
    let  info : String
    let  imageUrl : String
    let  tags : [String]
    
//    init(id : Int,  name : String,   info : String,  imageUrl : String,  tags : [String]) {
//        self.id  = id
//        self.name = name
//        self.info = info
//        self.imageUrl  = imageUrl
//        self.tags = tags
//    }
}
 
