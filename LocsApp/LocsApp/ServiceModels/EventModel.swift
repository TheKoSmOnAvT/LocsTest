//
//  Event.swift
//  LocsApp
//
//  Created by Никита Попов on 13.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation



public struct EventModel : Decodable {
    let id : Int
    let name :String
    let info : String
    let link :  String
    let ticket_price : Float
    let id_organizer : Int
    let id_address : Int
    let image : String
    let organization_name : String
    let logo : String
    let datatime : DataTime
    let tags : [Int]
    
}

public struct DataTime : Decodable {
    let year : Int
    let month : Int
    let date : Int
    let hours :Int
    let minutes : Int
}
