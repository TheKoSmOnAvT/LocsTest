//
//  EventModelView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

class EventModelView {
    var event : Event?
    var error : String?
   // var id : Int?
    
    
    
    init() {
        //self.id = id
    }
    
    func gedata(id : Int){
        print("1")
        let a = EventService(id: id)
        if let err = a.error {
            error = err
            print("2")
            return
        }
        if let data = a.data{
            self.event = Event(id: data.id,
                               name: data.name,
                               info: data.info,
                               link: data.link,
                               price: data.ticket_price,
                               idOrganizer: data.id_organizer,
                               nameOrganizer: data.organization_name,
                               logoOrganizer: data.logo,
                               imageEvent: data.image,
                              date: "02-02-2020 15:00",
                              tags: [Tag(id: 1, title: "test"),
                                    Tag(id: 2, title: "test2")
                                ])
        print("3")
        }
        
    }
}
