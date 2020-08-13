//
//  EventView.swift
//  LocsApp
//
//  Created by Никита Попов on 27.07.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventRowView: View {
    var event : eventshortlist
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Image("event").resizable()
            .scaledToFit()
            .frame(width: 65   , height: 65)
             Spacer()
            VStack(alignment: .leading){
                Text(event.name!).font(.headline)
                    .padding(.leading, 15)
            }.frame(width: 100, alignment: .leading)
            Spacer()
            VStack(alignment: .leading, spacing: 6){
                ForEach(randomArrayIndexTags(tagsArray: event.tags), id: \.self) { index in
                    Text("\(self.event.tags![index])")
                }
            }    .frame(width: 70, alignment: .leading)
        }.padding(.all, 5.0)
        }
    func randomArrayIndexTags(tagsArray: [String]?) -> [Int] {
        if let tags : [String] = tagsArray  {
            var array : [Int] = []
            let countTags = tags.count  + 1
            while (array.count < 3  && array.count < tags.count) {
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
      
        EventRowView(event: eventshortlist(id: 1, name: "naaaaaames", info: "aaaaaaaaaaaaaaaaa...", image: "", tags: ["tags","event","tusaaa"])).previewLayout(.fixed(width: 300, height: 70))
    }
}
