//
//  TextField.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 01.08.2021.
//

import UIKit

extension UITextField {
    
    static var addTextField: UITextField {
        let tex = UITextField()
        tex.font = .systemFont(ofSize: 20)
        tex.backgroundColor = .white
        tex.textAlignment = .center
        tex.text = "Write here...!"
        tex.textColor = .lightGray
        return tex
    }
}
