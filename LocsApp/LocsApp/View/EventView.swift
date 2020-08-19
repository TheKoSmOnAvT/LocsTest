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
            Text(viewModel.event?.name ?? "fail")
            //Text(viewModel.event!.info)
            Text("123123123")
       }.onAppear {
        self.viewModel.gedata(id: self.id ?? 0)
       }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(id: 1)
    }
}
