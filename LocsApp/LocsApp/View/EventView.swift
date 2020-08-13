//
//  EventView.swift
//  LocsApp
//
//  Created by Никита Попов on 13.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventView: View {
    var event : Event
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            Text(String(event.id))
            Image("event").resizable()
                .frame(width: 150   , height: 150)
            Text(event.name).bold().padding(.top, 10).padding(.horizontal, 10)
            Text("Info")
            
            Text(event.info).padding(.all, 12)
            //Spacer()
            Text("Address")
            HStack {
                Text(event.addressStreet)
                Spacer()
                Text(event.addressHouse)
            }.padding(.all, 20)
            HStack{
                Text("Price")
                Text(String(event.ticket_price))
            }
            HStack{
                Text("DataTime")
                Text(event.datatime)
           }
            //map
           
           //tags
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event(
            id: 1,
            name: "name the super mega event ",
            info: "this is so cool information about evet aaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasdasdasdasdadsasdasdasdasdasdasdasdasdasdasdasdasdfhaskdfasdf;hwefkjhsioudyvew",
            link: "http://www.socoolinfourl.com/111/111/111",
            ticket_price: 333.33,
            organizer: "OOONotBORingCompany",
            addressStreet: "Nice street number one",
            addressHouse: "awesome 12a",
            lattitude: 59,
            longtitude: 59,
            image: "",
            logo: "",
            datatime: "01-01-2020 18:00",
            tags: ["tag1","tag12","tag13","tag14","tag15","tag16","tag17","tag18","tag19",]))
    }
}
