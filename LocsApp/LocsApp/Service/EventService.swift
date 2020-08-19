//
//  EventServie.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation

class EventService {
    var error : Error?
    var data : EventModel?
    var id : Int
    var test = 0
    init(id : Int){
        self.id =  id
        print("c")
        self.getEvent()
print("cc")
    }
    
   // func getEvent(completion: @escaping (EventModel?, Error?) -> Void) {
        func getEvent() {
        do {
            let urlPath : String = "http://localhost:4000/event/info"
            
            if let url = URL(string: urlPath) {
                var request = URLRequest(url : url)
                request.httpMethod = "POST"
                
                var json = [String:Any]()
                json["idEvent"] = id
                
                let httpBody = try? JSONSerialization.data(withJSONObject: json, options: [])
                request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                request.httpBody = httpBody

              let task = URLSession.shared.dataTask(with: request) {
                    (data, response, err) in
                    if let err = err {
                        self.error = err
                      //  completion(nil, err)
                    }
                    var model : EventModel? = nil
                   do{
                        let datas = data
                        model = try JSONDecoder().decode(EventModel.self, from: datas!)
                       // self.data = model
                    } catch let jsonErr {
                      self.error = jsonErr
                        // completion(nil, jsonErr)
                    }
                self.data = model
                self.test = 2
                   // completion(model, err)
              }
              task.resume()
                print("a")
            }
        } catch let err{
            self.error = err
            // completion(nil, error)
        }
    }
}
