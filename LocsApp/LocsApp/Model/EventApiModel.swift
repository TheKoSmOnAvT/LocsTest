////
////  EventModel.swift
////  LocsApp
////
////  Created by Никита Попов on 13.08.2020.
////  Copyright © 2020 Никита Попов. All rights reserved.
////
//
//
//{
//        "id": int,
//        "name": string,
//        "info": string,
//        "link": string,
//        "ticket_price": int,
//        "id_organizer": int,
//        "id_address": int,
//        "image": string, ивент
//        "organization_name": string,
//        "logo": string, организатор
//        "datatime": {
//                "year": int,
//                "month": int,
//                "date": int,
//                "hours": int,
//                "minutes": int
//        },
//    "tags": [
//        {
//            "eventtags": {
//                "title": string
//            }
//        },
//    ]
//}
import Foundation

public struct EventApiModel {
    
    let id : Int
    let name :String
    let info : String
    let link :  String
    let ticket_price : Float
    let id_organizer : Int
    let id_address : Int
    let image : String
    let logo : String
    let datatime : DataTime
    let  tags : [String]?
    
}
    
    


public struct DataTime {
    let year : Int
    let month : Int
    let date : Int
    let hours : Int
    let minutes : Int
}
