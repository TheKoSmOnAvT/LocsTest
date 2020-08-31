//
//  ImageEventinfoView.swift
//  LocsApp
//
//  Created by Никита Попов on 29.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct ImageEventinfoView: View {
    var logo : Image?
    var body: some View {
        VStack{
            if logo != nil {
                Text("logo evet")
             //   Image(uiImage: logo!)
            } else {
                Image("event").resizable().frame(width: 100, height : 100)
                    .padding(15).overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 10))
                .background(Color.orange)
                
                
            }
        }
    }
}

struct ImageEventinfoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageEventinfoView()
    }
}
