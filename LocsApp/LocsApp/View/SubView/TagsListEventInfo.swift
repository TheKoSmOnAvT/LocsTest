//
//  TagsListEventInfo.swift
//  LocsApp
//
//  Created by Никита Попов on 31.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct TagsListEventInfo: View {
    var tags : [Tag]
    var body: some View {
        VStack(alignment: .center, spacing: 10){
                ForEach(0..<self.tags.count/3) { row in
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(0..<3) { column in
                            Text(self.tags[row * 3 + column].title).padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.orange, lineWidth: 4)
                            )
                        }
                    }
        }
        }
    }
}

struct TagsListEventInfo_Previews: PreviewProvider {
    static var previews: some View {
        
        TagsListEventInfo(tags: [
         Tag(id: 1, title: "tag1"),
         Tag(id: 2, title: "tag2"),
         Tag(id: 3, title: "tag3"),
         Tag(id: 4, title: "tag4"),
         Tag(id: 5, title: "tag5"),
         Tag(id: 6, title: "tag6"),
         Tag(id: 7, title: "tag7"),
         Tag(id: 8, title: "tag8"),
         Tag(id: 9, title: "tag9"),
         Tag(id: 10, title: "tag10"),
        ])
    }
}
