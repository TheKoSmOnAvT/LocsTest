//
//  EventList.swift
//  LocsApp
//
//  Created by Никита Попов on 04.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

public struct EventListModel : Decodable {
    
    let count : Int
    let Events : [Events]?
    
    
           
}
public struct Events  : Decodable {
    let eventshortlist :  eventshortlist
}

public  struct eventshortlist : Decodable{
       let  id : Int
       let  name : String?
       let  info : String?
       let  image : String?
       let  tags : [String]?
   }
