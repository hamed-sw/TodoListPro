//
//  AddInToTodoListViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 27.07.2021.
//

import UIKit

class AddInToTodoListViewController: UIViewController {
    
    private let addLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
       let  butt = UIButton()
        butt.backgroundColor = .white
        butt.setTitle("add", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.layer.cornerRadius = 52
        return butt
    }()
    
    //let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(addLabel)
        view.addSubview(button)
        title = " Enter what you want"
        frame()
        dismissButton()
        //buttonTap()

    }
    // Dismiss button
    func dismissButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dissmis))
    }
    @objc private func dissmis() {
        dismiss(animated: true, completion: nil)
    }
    //button
    func buttonTap() {
        button.addTarget(self, action: #selector(didtapbutton), for: .touchUpInside)
    }
    
    @objc func didtapbutton() {
        dismiss(animated: true, completion: nil)
    }

    
    func frame() {
        addLabel.frame = CGRect(x: 5, y: 5, width: 40, height: 20)
        button.frame = CGRect(x: 5, y: 30, width: 40, height: 20)

    }
//    func viewFor() -> UIView {
//        let theView = UIView(frame: CGRect(x: 50, y: 200, width: 300 , height: 500))
//        theView.backgroundColor = .blue
//        addLabel.frame = CGRect(x: 5, y: 5, width: view.frame.size.width - 20, height: view.frame.size.height/25)
//        //button.frame = CGRect(x: 100, y: 250, width: 150, height: 50)
//
//        theView.addSubview(addLabel)
//       // theStackView.addSubview(button)
//
//        return theView
//
//    }
    
    
 
    
    //    func buttonAdding() {
    //        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    //        navigationItem.rightBarButtonItems = [button]
    //       // forRefreshing()
    //
    //    }
    //    @objc func addItem() {
    //        viewModel.forAddingIntoTodoList(viewController: self)
    //        forRefreshing()
    //    }

}
