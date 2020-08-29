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
                Image("event").resizable().frame(width: 180, height : 180).clipShape(Circle()).cornerRadius(10).overlay(Circle().stroke(Color.gray, lineWidth: 6))
                    .shadow(radius: 6)
            }
        }
    }
}

struct ImageEventinfoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageEventinfoView()
    }
}
