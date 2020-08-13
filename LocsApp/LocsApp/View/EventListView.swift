//
//  EventListView.swift
//  LocsApp
//
//  Created by Никита Попов on 06.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventListView : View {
    
    var eventList : [Events]
    
    var body: some View {
            List {
                ForEach(eventList.indices) { obj in
                EventRowView(event: self.eventList[obj].eventshortlist)
            }
        }

    }


struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(eventList :  [
            Events(eventshortlist: eventshortlist(id: 3, name: "3", info: "1", image: "", tags: ["tag1", "tag2", "tag3", "tag4"])),
               Events(eventshortlist: eventshortlist(id: 5, name: "5", info: "1", image: "", tags: ["tag1", "tag2"])),
            
            Events(eventshortlist: eventshortlist(id: 2, name: "2", info: "1", image: "", tags: ["tag1", "tag2", "tag3"])),
            
            Events(eventshortlist: eventshortlist( id: 1, name: "1", info: "123", image: "", tags: ["tag11", "tag21"])),
            
                   Events(eventshortlist: eventshortlist(id: 6, name: "6namingsolongssssssssssssssssssssssssssssssssssssssssssssssss", info: "1", image: "", tags: ["ТЕСТИРУМ", "ееееееееееееее", "tag3", "tag4"])),
            
              Events(eventshortlist: eventshortlist( id: 4, name: "4", info: "123", image: "", tags: ["tag11"]))
        
        
        
        ])
    }
}
}
            
//            , image: "", tags: ["tag1", "tag2"])),
//        Events(eventshortlist: eventshortlist(id: 2, name: "1", info: "1", image: "", tags: ["tag11", "tag21"])),
//        Events(eventshortlist: eventshortlist(id: 3, name: "1", info: "1", image: "", tags: ["tag11", "tag21", "tag3"])),
//
//        ])
//    }
//}
//}
