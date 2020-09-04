//
//  EventRowView.swift
//  LocsApp
//
//  Created by Никита Попов on 04.09.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventRowView: View {
    var event :  EventShortListInfoModel
  @ObservedObject var modelView = EventShortInfoViewModel()
    
    var body: some View {
        HStack(alignment: .center, spacing: 50){
            ImageEventinfoView(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 10){
                Text(event.name).background(Color.white).cornerRadius(20)
                Text(modelView.time)
                   Text(modelView.date)
            }
                VStack(alignment: .leading, spacing: 10){
                    ForEach( modelView.tags, id: \.id) { tag in
                       Text(tag.title)
                    }
                }
            
        }.onAppear  {
            self.modelView.convertData(event: self.event)
        }  //.padding().border(Color.black, width: 4)
        
    }
    
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: EventShortListInfoModel(id: 1, name: "test", date: 1599233510, idAddress: 1, image: "123", tags: [123])) //.previewLayout(.fixed(width: 300, height: 70))
    }
}
