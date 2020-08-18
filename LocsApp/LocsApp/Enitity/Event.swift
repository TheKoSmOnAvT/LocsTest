//
//  Event.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

struct Event {
    let id : Int
    let name : String
    let info : String
    let link : String
    let price : Float
    let idOrganizer : Int
    let nameOrganizer : String
    let logoOrganizer : String
    let imageEvent : String
    let date : String
    let tags : [Tag]
}
