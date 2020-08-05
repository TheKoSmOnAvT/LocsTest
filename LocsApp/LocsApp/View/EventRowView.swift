//
//  EventView.swift
//  LocsApp
//
//  Created by Никита Попов on 27.07.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventRowView: View {
    var listEvent : eventshortlist
 //   @State var randomArray : [Int] = randomArrayIndexTags(tags: listEvent.tags?)
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Image("event").resizable()
            .scaledToFit()
            .frame(width: 70   , height: 70)
            VStack(alignment: .leading){
                Text(listEvent.name!).font(.headline)
                    .padding(.leading, 15)
             //   Text(listEvent.info  ??  "")
             //   .padding(.leading, 5)
            }.frame(width: 100, alignment: .leading)
            Spacer()
            VStack(alignment: .leading,   spacing: 5){
                ForEach(randomArrayIndexTags(tagsArray: listEvent.tags), id: \.self) { index in
                    Text("\(self.listEvent.tags![index])")
                }
            }
            
        }
        
    
        }
    func randomArrayIndexTags(tagsArray: [String]?) -> [Int] {
        if let tags : [String] = tagsArray  {
            var array : [Int] = []
            let countTags = tags.count  + 1
            while (tags.count < 3  && array.count < tags.count) {
                var rnd = Int.random(in: 1..<countTags)
                rnd = rnd - 1
                if !array.contains(rnd) {
                    array.append(rnd)
                }
            }
            return array
        } else {
            return []
        }
        
        }
    }



struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
     
       // let listEvent = EventListViewModel()
       // let a = listEvent.listEvent.Events!
       
        EventRowView(listEvent: eventshortlist(id: 1, name: "names", info: "aaaaaaaaaaaaaaaaa...", image: "", tags: ["tags","event","tusa"]))
    }
}
