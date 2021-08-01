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
    

    
    func navigationConfig(nav: UIViewController) {
        nav.title = "List"
        let nadv = nav.navigationController?.navigationBar
        nadv?.backgroundColor = .gray
    }
  
    func addItem(viewController: UIViewController){
        let vc = AddInToTodoListViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        viewController.present(navVC, animated: true)
    }
    
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
// for deleting one by one.
    func forDeletOneByOne(indexPath: IndexPath, tableView: UITableView) {
       let index = todoArray[indexPath.row].subName
       let theDeletOpetion = takeIdFromUrl(at: index)
       deleteFormList(the: theDeletOpetion)
       todoArray.remove(at: indexPath.row)
    }

    func activityIndicator(activity: UIActivityIndicatorView, view: UIView) {
        activity.center = view.center
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.color = UIColor.black
        view.addSubview(activity)
    }
    
    func startActivity(activity: UIActivityIndicatorView, view: UIView) {
        activity.startAnimating()
        view.isUserInteractionEnabled = false
    }
    func stopActivity(activity: UIActivityIndicatorView, view: UIView) {
        activity.stopAnimating()
        view.isUserInteractionEnabled = true
    }

    
  
    
    
}
