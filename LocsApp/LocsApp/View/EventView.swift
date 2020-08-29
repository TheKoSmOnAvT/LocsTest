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
    
     @ObservedObject var viewModel = EventViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if viewModel.event != nil {
                
                HStack(alignment: .center, spacing: 60) {
                    ImageEventinfoView()
                    VStack(alignment: .center, spacing: 10) {
                        Text(viewModel.event!.name).font(.headline).padding().background(Color.white).cornerRadius(20)
                        VStack(alignment: .center) {
                            Text("\(viewModel.dateString)")
                            Text("\(viewModel.timeString)")
                        }.padding(5).background(Color.white).cornerRadius(10)
                        
                    }.padding(.all, 10).background(Color.gray).edgesIgnoringSafeArea(.all)
                    }.frame(maxWidth: .infinity, minHeight:  200).background(Color.gray).border(Color.white, width: 5)
                
             HStack {
                Text(viewModel.event!.info)
                }.background(Color.gray)
                
            HStack {
                Text("Организзатор:")
                Text(viewModel.event!.organization_name)
                }
            
            HStack {
               Text("Цена:")
               Text("\((String(format:"%.2f", viewModel.event!.ticket_price)))")
                   }
            
            HStack {
              Text("Сайт мероприятия:")
              Text( viewModel.event!.link)
                  }
               
               Spacer()
                
            } else {
                  Text("упс, что-то пошло не так...")
            }
            
       }.onAppear {
        self.viewModel.gedata(id: self.id)
            }.background(Color.orange)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(id: 1)
    }
}
