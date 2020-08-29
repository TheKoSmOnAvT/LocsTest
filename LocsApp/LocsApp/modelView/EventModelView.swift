//
//  EventModelView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class EventModelView :  ObservableObject {
    
    @Published var event : EventModel?
    @Published var error : String?
    @Published var tags : [Tag]
    
    init(){
        tags = []
    }
    
    
    func gedata(id :  Int) {
           let requestGroup =  DispatchGroup()


           requestGroup.enter()
           requestGroup.enter()
          // requestGroup.enter()

        AF.request("http://localhost:4000/event/info", method: .post,  parameters: ["idEvent": id]).responseData { response in
            self.event = try? JSONDecoder().decode(EventModel.self, from: response.data!)
            print("DEBUG: FIRST Request")
               requestGroup.leave()
           }
        
        getTag(requestGroup: requestGroup)
           //This only gets executed once all the above are done
           requestGroup.notify(queue: DispatchQueue.main, execute: {
               // Hide HUD, refresh data, etc.
                print("DEBUG: all Done")
           })

    }



func getTag(requestGroup : DispatchGroup){
    AF.request("http://localhost:4000/event/tag", method: .get).responseData { response in
     //self.tags = try? JSONDecoder().decode(Tag.self, from: response.data!)
        self.tags.append( Tag(id: 1, title: "test"))
     print("DEBUG: second Request")
        requestGroup.leave()
    }
}

}
