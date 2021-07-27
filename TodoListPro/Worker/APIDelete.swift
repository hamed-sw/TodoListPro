//
//  APIDelete.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import Foundation

class JsonForDelete {
    
    static let shared = JsonForDelete()
    
//    struct Constants {
//        static let deleteUrl = URL(string: "https://firestore.googleapis.com/v1/projects/online-46aa4/databases/(default)/documents/todolist")
//    }
    
    private init(){ }
    
    public func deleteFormTodoList(id: String, completion: @escaping (Error?)-> ()) {
        guard let url = URL(string: "https://firestore.googleapis.com/v1/projects/online-46aa4/databases/(default)/documents/todolist/\(id)") else {return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(error)
                    return
                }
                completion(nil)
            }
        }.resume()
        
    }
    
    
    
}
