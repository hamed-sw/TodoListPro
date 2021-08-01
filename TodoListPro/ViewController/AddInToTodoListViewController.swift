//
//  AddInToTodoListViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 27.07.2021.
//

import UIKit

class AddInToTodoListViewController: UIViewController,UITextFieldDelegate {
    
    lazy var viewModel = PostViewModel()
    var stacView = StackView()
    let lab = UILabel()
 
    let add:UITextField = .addTextField
    let butt:UIButton = .button
    let label:UILabel = .configrationLabel


    
    //let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        //addTextField.delegate = self
        add.delegate = self
        view.backgroundColor = .systemGray
       // createStackview(lab: addTextField, button: button)
        stackView()
        buttonTap()
        configration()
        dismissButton()
    }
    func configration(){
        view.addSubview(label)
        setTitleLableConstraints()
    }
    // Dismiss button
    func dismissButton() {
        title = "Adding Data"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "<Back", style: .plain, target: self, action: #selector(dissmis))
    }
    @objc private func dissmis() {
        dismiss(animated: true, completion: nil)
    }
    //button
    func buttonTap() {
        butt.addTarget(self, action: #selector(didtapbutton), for: .touchUpInside)
    }
    
    @objc func didtapbutton() {
        viewModel.enteryTextfield(textField: add, viewController: self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewModel.textFieldDidBingEding(textField: add)
    }
    func stackView() {
        stacView.createStackview(lab: add, button: butt, view: view)
    }

    func setTitleLableConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
}
