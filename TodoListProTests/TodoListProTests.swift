//
//  TodoListProTests.swift
//  TodoListProTests
//
//  Created by Hamed Amiry on 02.08.2021.
//

import XCTest
@testable import TodoListPro

class TodoListProTests: XCTestCase {
    
    func test_can_parse_TodoList() {
        
        let addIntoListJson = """
            {
               "documents":[
                  {
                     "name":"projects/online-46aa4/databases/(default)/documents/todolist/6qcZnm9aAbDKvS2bLh2s",
                     "fields":{
                        "name":{
                           "stringValue":"One and four"
                        }
                     },
                     "createTime":"2021-08-13T12:20:14.531528Z",
                     "updateTime":"2021-08-13T12:20:14.531528Z"
                  }
               ]
            }
            """
        let jsonData = addIntoListJson.data(using: .utf8)
        let todoListData = try! JSONDecoder().decode(APIResponce.self, from: jsonData!)
        //let name = APIResponce.init(documents: [0])
        
        XCTAssertEqual("One and four", todoListData.documents[0].fields.name.stringValue)
    }
    
    func test_can_parse_TodoListMaybe_EmptyName() {
        
        let addIntoListJson = """
            {
               "documents":[
                  {
                     "name":"projects/online-46aa4/databases/(default)/documents/todolist/6qcZnm9aAbDKvS2bLh2s",
                     "fields":{
                        "name":{
                           "stringValue":
                        }
                     },
                     "createTime":"2021-08-13T12:20:14.531528Z",
                     "updateTime":"2021-08-13T12:20:14.531528Z"
                  }
               ]
            }
            """
        guard let jsonData = addIntoListJson.data(using: .utf8) else { fatalError("the Todo list is empty")}
        let todoListData = try? JSONDecoder().decode(APIResponce.self, from: jsonData )
        //let name = APIResponce.init(documents: [0])
        
      //  XCTAssertEqual("", todoListData.documents[0].fields.name.stringValue)
        XCTAssertNil(todoListData?.documents[0].fields.name.stringValue)
    }
    
    func test_takeIdFromstring() {
        let viewModel = TodoViewModel()
        let theString = "projects/online-46aa4/databases/(default)/documents/todolist/6qcZnm9aAbDKvS2bLh2s"
        let id = "6qcZnm9aAbDKvS2bLh2s"
        let str = viewModel.takeIdFromUrl(at: theString)
        XCTAssertEqual(id, str)
    }

   

}




