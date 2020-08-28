//
//  EventModelView.swift
//  LocsApp
//
//  Created by Никита Попов on 18.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation
import Combine

class EventModelView :  ObservableObject{
    @Published var event : EventModel?
    @Published var error : String?
    @Published var tags : [Tag]
    
    init(){
        tags = []
    }
    
    
    
    
    func gedata(id : Int){
        let urlPath : String = "http://localhost:4000/event/info"
        guard let url = URL(string: urlPath) else { return }
            var request = URLRequest(url : url)
            request.httpMethod = "POST"
            var json = [String:Any]()
            json["idEvent"] = id
            let httpBody = try? JSONSerialization.data(withJSONObject: json, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = httpBody
            URLSession.shared.dataTask(with: request) {
                (data, response, err) in
                DispatchQueue.main.async {
                    if let err = err {
                       return
                   }
                   let status = (response as! HTTPURLResponse).statusCode
                   if(status < 200 || status > 299){
                       return
                   } else {
                        self.event = try? JSONDecoder().decode(EventModel.self, from: data!)
                    self.getTags()
                    print("123")
                        }
                    }
            }.resume()
        
    }
    
    
    func getTags(){
        let urlPath : String = "http://localhost:4000/event/tag"
        guard let url = URL(string: urlPath) else { return }
            var request = URLRequest(url : url)
            request.httpMethod = "GET"
           
            URLSession.shared.dataTask(with: request) {
                (data, response, err) in
                DispatchQueue.main.async {
                    if let err = err {
                       return
                   }
                   let status = (response as! HTTPURLResponse).statusCode
                   if(status < 200 || status > 299){
                       return
                   } else {
                    let a = try? JSONDecoder().decode([Tag].self, from: data!)
                    print(a)
                        }
                    }
            }.resume()
    }
}
