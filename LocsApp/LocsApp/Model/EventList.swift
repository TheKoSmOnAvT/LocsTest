//
//  EventList.swift
//  LocsApp
//
//  Created by Никита Попов on 04.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

public struct EventList : Decodable {
    
    let count : Int
    let Events : [Events]?
    
    struct Events  : Decodable {
        let eventshortlist :  eventshortlist
    }
    
    struct eventshortlist : Decodable{
        let  id : Int
        let  name : String?
        let  info : String?
        let  image : String?
        let  tags : [String]?
    }
       
}
