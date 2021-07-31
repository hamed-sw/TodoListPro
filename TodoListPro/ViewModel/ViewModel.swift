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
 //...............................................................................
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

//...............................................................................
 // delete data
    public func deleteFormList(the id: String){
        JsonForDelete.shared.deleteFormTodoList(id: id) { error in
            if let error = error {
                print("we have error for delete\(error)")
            } else {
                print("the data delete")
            }
        }
    }
    
    
   // Adding in to TodoList By Alertaction.
//    func forAddingIntoTodoList(viewController: UIViewController) {
//        let alert = UIAlertController(title: "In TodoList", message: "plesae add something you need!", preferredStyle: .alert)
//        alert.addTextField { textField in
//            textField.placeholder = " Enter in here...."
//        }
//        let action = UIAlertAction(title: "Add", style: .default) { _ in
//            guard let addlist = alert.textFields?.first?.text else {
//                return
//            }
//            //self.postInList(insertData: addlist)
//        }
//        alert.addAction(action)
//        viewController.present(alert, animated: true)
//    }
    
    
  
    
     func refresh(tableView: UITableView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            tableView.refreshControl?.endRefreshing()
            tableView.reloadData()
            self.fetchTodoList()
        }
    }
    
    func takeIdFromUrl(at string:String) -> String {
        
        let size = string.reversed().firstIndex(of: "/") ?? string.count
        let startWord = string.index(string.endIndex, offsetBy: -size)
        let last = string[startWord...]
        let deleteTheString = String(last)
        return deleteTheString
    }
    


    
  
    
    
}
