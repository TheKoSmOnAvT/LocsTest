//
//  EventServie.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

class EventService {
    var error : String?
    var data : EventModel?
    
    init(id : Int){
        getEvent(id : id)
   }
    
    func getEvent(id : Int) {
        let urlPath : String = "http://localhost:4000/event/info"
        if let url = URL(string: urlPath) {
            var request = URLRequest(url : url)
            request.httpMethod = "POST"
            
            var json = [String:Any]()
            json["idEvent"] = id
            
            guard let httpBody = try? JSONSerialization.data(withJSONObject: json, options: []) else {
                error = "Bad JSONSerialization"
                       return
                   }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = httpBody

           let task = URLSession.shared.dataTask(with: request) {
                (data, response, err) in
                if let err = err {
                    self.error = "Error :\(err)"
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    self.data = try! decoder.decode(EventModel.self, from: data)
                    return
                } else {
                    self.error = "data err"
                    return
                }
                
            }
             task.resume()
        } else {
            self.error = "Bad Path"
            return
        }
    }
}
