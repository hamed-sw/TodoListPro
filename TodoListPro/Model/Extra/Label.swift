//
//  Label.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 01.08.2021.
//

import UIKit

extension UILabel {
    
    static var  configrationLabel: UILabel  {
        let lab = UILabel()
        //view.addSubview(lab)
        lab.text = "Here you can add into TodoList"
        lab.font = UIFont.boldSystemFont(ofSize: 36)
        lab.textAlignment = .center
        lab.numberOfLines = 0
        lab.adjustsFontSizeToFitWidth = true
        return lab
    }
}
