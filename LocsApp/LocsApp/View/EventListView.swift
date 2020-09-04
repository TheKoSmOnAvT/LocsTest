//
//  EventListView.swift
//  LocsApp
//
//  Created by Никита Попов on 04.09.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject var events = EventShortListViewModel()
    var body: some View {
           NavigationView {
            List(events.events, id: \.id) { event in
                EventRowView(event: event)
            }
           }.onAppear{
            self.events.gedata()
        }
    }
}


struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
