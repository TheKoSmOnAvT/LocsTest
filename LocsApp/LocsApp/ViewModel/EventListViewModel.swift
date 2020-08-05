//
//  EventListViewMovel.swift
//  LocsApp
//
//  Created by Никита Попов on 05.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

class EventListViewModel {
    public var listEvent : EventListModel
    init (){
      let  apiEventList  : EventApi? = EventApi()
        if var object = apiEventList?.object {
            listEvent = object
        } else {
            listEvent = EventListModel(count: 0, Events: nil)
        }
    }
}
