//
//  ButtonTap.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 01.08.2021.
//

import UIKit

extension UIButton {
    
    static var button: UIButton  {
        let  butt = UIButton()
        butt.backgroundColor = .white
        butt.setTitle("add", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.layer.cornerRadius = 10
        butt.frame = CGRect(x: 100, y: 600, width: UIScreen.main.bounds.width - 200, height: 30)
        return butt
    }
}
