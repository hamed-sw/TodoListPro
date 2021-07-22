//
//  APIPost.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import Foundation

class JsonForPost {
    
    static let shared = JsonForPost()
    
    struct Constants {
        static let urlData = URL(string: "https://firestore.googleapis.com/v1/projects/online-46aa4/databases/(default)/documents/todolist")
    }
    
    private init() {}
    
    public func AddInTodoList(addData name:String) {
        
        let addIntoList = [ "fields": [
            "name": [
                "stringValue": name
            ],
         ]
        ]
        
        guard let url = Constants.urlData else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "post"
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: addIntoList, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
        }catch let error {
            debugPrint(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if (data != nil && data?.count != 0) {
                let response  = String(data: data!, encoding: .utf8)
                print(response)
            }
        }.resume()
        
    }
    
}
