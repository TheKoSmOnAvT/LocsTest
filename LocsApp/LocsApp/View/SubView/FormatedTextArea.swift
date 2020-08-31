//
//  FormatedTextArea.swift
//  LocsApp
//
//  Created by Никита Попов on 31.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct FormatedTextArea: View {
    var title : String
    var info : String
    var colore : Color
    var borderColore : Color
    
    var body: some View {
        HStack(alignment : .top) {
            Text(title).font(.body).padding().background(Color.white).cornerRadius(20)
            Text(info).font(.body).padding().background(Color.white).cornerRadius(20)
        }.frame(maxWidth: .infinity, minHeight:  80).background(colore).overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(borderColore, lineWidth: 6).padding(.bottom, 5)
        )
    }
}

struct FormatedTextArea_Previews: PreviewProvider {
    static var previews: some View {
        FormatedTextArea(title : "Цена:", info : "2000", colore: Color.white, borderColore: Color.black)
    }
}
