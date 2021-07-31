//
//  PostViewModel.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 31.07.2021.
//

import UIKit

class PostViewModel {
    
    
    //................................................................................
    // post data
     func postInList(insertData: String ) {
        JsonForPost.shared.AddInTodoList(addData: insertData)
        
    }
    
    func enteryTextfield(textField addTextField: UITextField, viewController: UIViewController) {
        guard let textField = addTextField.text else {return}
        
        if addTextField.text != nil && addTextField.textColor == UIColor.lightGray {
            viewController.dismiss(animated: true, completion: nil)
        }else if addTextField.text == "" && addTextField.textColor == UIColor.black {
            viewController.dismiss(animated: true, completion: nil)
        }else {
            postInList(insertData: textField)
            viewController.dismiss(animated: true, completion: nil)
        }
    }
}
