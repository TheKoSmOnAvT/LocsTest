//
//  EventModelView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine

class EventModelView :  ObservableObject{
   @Published var event : Event?
    @Published var error : String?

    
    func gedata(id : Int){
        print("5")
        let a = EventService(id: id)
        
        if let err = a.error {
            error = String(err.localizedDescription)
            return
        }
        //асинхронно работает как-то?
        print("\(a.data!)")
        
        if let data = a.data {
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
        }
        print("3")
    }
}
