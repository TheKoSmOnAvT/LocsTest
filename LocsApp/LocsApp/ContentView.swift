//
//  ContentView.swift
//  LocsApp
//
//  Created by Никита Попов on 27.07.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        EventRowView(listEvent: eventshortlist(id: 1, name: "names", info: "aaaaaaaaaaaaaaaaa...", image: "", tags: ["tags","event"]))
       // EventRowView(listEvent: <#eventshortlist#>)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
