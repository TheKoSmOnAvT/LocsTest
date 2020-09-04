//
//  EventShortInfoViewModel.swift
//  LocsApp
//
//  Created by Никита Попов on 04.09.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

class EventShortInfoViewModel :  ObservableObject {
    @Published var event : EventShortListInfoModel?
    var address : String
    var date : String
    var time : String
    var tags : [Tag] //сделать только 3 тега
    //image
    
    init(){
        address = ""
        date = ""
        time = ""
        tags = []
    }
    
    func convertData(event : EventShortListInfoModel) {
         self.event = event
        dateToString()
        getAddress()
        dateToString()
        getTags()
    }
    func getAddress(){
        //тут вызов функции для получения адреса
        address = "улица фонарь 24"
    }
    
    func getTags(){
        tags = [Tag(id: 1, title: "tag"),Tag(id: 1, title: "tag"),Tag(id: 1, title: "tag")]
    }
    
    func dateToString(){
        if let eventDate = event?.date  {
        let date = NSDate(timeIntervalSince1970: eventDate)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd-mm-YYYY"
        self.date = dayTimePeriodFormatter.string(from: date as Date)
        dayTimePeriodFormatter.dateFormat = "hh:mm"
         self.time = dayTimePeriodFormatter.string(from: date as Date)
       }
    }
    
}
