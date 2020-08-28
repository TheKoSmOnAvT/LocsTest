//
//  EventView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct EventView: View {
    var id: Int
    
     @ObservedObject var viewModel = EventModelView()
    var body: some View {
        VStack {
            if viewModel.event != nil {
                Text(viewModel.event!.name)
                Text(viewModel.event!.info)
                Text(viewModel.event!.organization_name)
            } else {
                  Text("error")
            }
       }.onAppear {
        self.viewModel.gedata(id: self.id)
       }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(id: 1)
    }
}
