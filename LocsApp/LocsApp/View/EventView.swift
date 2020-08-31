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
        ScrollView {
        VStack(alignment: .leading ) {
                    
            if viewModel.event != nil {
                
                HStack(alignment: .center, spacing: 20) {
                    
                    ImageEventinfoView()
                    
                    VStack(alignment: .center, spacing: 10) {
                        
                        Text(viewModel.event!.name).font(.largeTitle).padding().background(Color.white).cornerRadius(20)
                        
                        VStack(alignment: .center) {
                            Text("\(viewModel.dateString)")
                            Text("\(viewModel.timeString)")
                        }.padding(.all, 10).background(Color.white).cornerRadius(10)
                        
                    }.background(Color.gray)
                }.frame(maxWidth: .infinity, minHeight:  200).background(Color.gray)
               
    
                FormatedTextArea(title  :"Информация", info : viewModel.event!.info, colore: Color.white, borderColore: Color.white)
                
                FormatedTextArea(title  :"Организзатор", info : viewModel.event!.organization_name, colore: Color.orange, borderColore: Color.orange)
                                
                FormatedTextArea(title  :"Цена", info : String(format:"%.2f", viewModel.event!.ticket_price), colore: Color.gray, borderColore: Color.gray)
                                               
                 FormatedTextArea(title  :"Сайт мероприятия", info : viewModel.event!.link, colore: Color.white, borderColore: Color.white)
                
                TagsListEventInfo(tags: viewModel.allTags)
                
               
                
            } else {
                  Text("упс, что-то пошло не так...")
            }
            
       }    .onAppear {
        self.viewModel.gedata(id: self.id)
                    }.frame(maxWidth: .infinity)
    }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(id: 1)
    }
}
