//
//  APIGetter.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import Foundation

final class APIParsing {
    static let shared = APIParsing()
    
    //define some constance
    
    struct Constants {
        static let todoListURL = URL(string: "https://firestore.googleapis.com/v1/projects/online-46aa4/databases/(default)/documents/todolist")
    }
    private init(){}
    
    public func getDataFromtodoList(completion: @escaping (Result<[TodoFile], Error>) -> Void) {
        // unwrap the Constant URL becase it is opetional
        guard let url = Constants.todoListURL else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponce.self, from: data)
                    print("total: \(result.documents.count)")
                    completion(.success(result.documents))
                }catch {
                    completion(.failure(error))
                }
            }
            
        }.resume()
        
    }
}
