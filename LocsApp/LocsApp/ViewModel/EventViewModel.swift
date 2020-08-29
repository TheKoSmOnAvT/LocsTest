//
//  EventModelView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class EventViewModel :  ObservableObject {
    
    @Published var event : EventModel?
    @Published var error : String?
    @Published var tags : [Tag]
    var dateString : String
    var timeString : String
    
    init(){
        tags = []
        dateString = ""
        timeString = ""
    }
    
    
    func gedata(id :  Int) {
        let requestGroup =  DispatchGroup()
        requestGroup.enter()
        requestGroup.enter()
        //получение информации о ивенте по api
        getEventInformation(id : id, requestGroup: requestGroup)
    
        //тестовое решение для получения тегов
        getTag(requestGroup: requestGroup)
        
        
        
           //This only gets executed once all the above are done
           requestGroup.notify(queue: DispatchQueue.main, execute: {
               // Hide HUD, refresh data, etc.
                print("DEBUG: all Done")
           })

    }

    func getEventInformation(id : Int, requestGroup : DispatchGroup){
        AF.request("http://localhost:4000/event/info", method: .post,  parameters: ["idEvent": id]).responseData { response in
         self.event = try? JSONDecoder().decode(EventModel.self, from: response.data!)
         print("DEBUG: FIRST Request")
            self.dateToString()
            requestGroup.leave()
        }
    }
    
    
    

    func getTag(requestGroup : DispatchGroup){
        AF.request("http://localhost:4000/event/tag", method: .get).responseData { response in
         //self.tags = try? JSONDecoder().decode(Tag.self, from: response.data!)
            self.tags.append( Tag(id: 1, title: "test"))
         print("DEBUG: second Request")
            requestGroup.leave()
        }
    }

    func dateToString(){
        if let datatime = event?.datatime {
            dateString = (datatime.date < 10 ? "0\(datatime.date)" : String(datatime.date)) + "-"
            dateString = dateString + (datatime.month < 10 ? "0\(datatime.month)" : String(datatime.month)) + "-\(datatime.year)"
            timeString = "\(datatime.hours):" + (datatime.minutes < 10 ? "0\(datatime.minutes)" : String(datatime.minutes))
        } else {return}
    }
}
