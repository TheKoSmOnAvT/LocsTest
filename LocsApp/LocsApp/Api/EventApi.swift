//
//  EventApi.swift
//  LocsApp
//
//  Created by Никита Попов on 04.08.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import Foundation


public class EventApi {
    
    var object : EventList?
    
    init(){
     //   let data 
    let url = URL(string: "http://localhost:4000/event/list/20/1")
         // Create URL Request
         var request = URLRequest(url: url!)
         // Specify HTTP Method to use
         request.httpMethod = "GET"
         // Send HTTP Request
         let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
             
             // Check if Error took place
             if let error = error {
                 print("Error took place \(error)")
                 return
             }
             
             // Read HTTP Response Status code
             if let response = response as? HTTPURLResponse {
                 print("Response HTTP Status code: \(response.statusCode)")
             }
             
             // Convert HTTP Response Data to a simple String
             if let data = data, let dataString = String(data: data, encoding: .utf8) {
                // print("Response data string:\n \(dataString)")
               let decoder = JSONDecoder()
                self.object = try! decoder.decode(EventList.self, from:data)
             }
             
         }
         task.resume()
     }
    
}
