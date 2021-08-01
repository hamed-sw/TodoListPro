//
//  Strackview.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 01.08.2021.
//

import UIKit


class StackView {
    
    func createStackview(lab:UITextField, button:UIButton, view: UIView) {
        let stackView = UIStackView(arrangedSubviews: [lab,button])
        view.addSubview(stackView)
        stackView.frame = CGRect(x: 50, y: 250, width: UIScreen.main.bounds.width - 100, height: 150)
        stackView.backgroundColor = .systemGray
        //config
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }
}
