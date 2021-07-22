//
//  ViewModel.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import UIKit

protocol DoRefreshTable: AnyObject {
    func update()
}

class TodoViewModel {
    
    var todoArray = [CellViewModel]()
    weak var delegate: DoRefreshTable?
// get data
    public func fetchTodoList() {
        APIParsing.shared.getDataFromtodoList { [weak self] result in

            switch result {
            case .success(let todoFile):
                self?.todoArray = todoFile.compactMap({
                    CellViewModel(name: $0.fields.name.stringValue,
                                  subName: $0.name)
                })
                self?.delegate?.update()
                
            case .failure(let error):
                print(error)
            }
        }
    }
// post data
    public func postInList(insertData: String ) {
        JsonForPost.shared.AddInTodoList(addData: insertData)
        
    }
    
    
}
