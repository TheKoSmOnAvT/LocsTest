//
//  EventShortListViewModel.swift
//  LocsApp
//
//  Created by Никита Попов on 04.09.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine
import Alamofire


class EventShortListViewModel :  ObservableObject {
    @Published var events : [EventShortListInfoModel]
    
    init(){
        events = []
    }
    func gedata() {
            let requestGroup =  DispatchGroup()
            requestGroup.enter()
        
            getEventInformation(requestGroup: requestGroup)
            requestGroup.notify(queue: DispatchQueue.main, execute: {
                print("DEBUG: all Done")
           })
    }
    
    func getEventInformation(requestGroup : DispatchGroup, list : Int = 1, count : Int = 8){
        AF.request("http://localhost:4000/event/list/\(count).\(list)", method: .get ).responseData { response in
          do {
            let obj = try JSONDecoder().decode([EventShortListInfoModel].self, from: response.data!)
            self.events = obj
            } catch let decodeError {
                print("Failed to decode:", decodeError)
            }
            requestGroup.leave()
        }
    }
}



