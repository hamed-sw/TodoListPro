//
//  AddInToTodoListViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 27.07.2021.
//

import UIKit

class AddInToTodoListViewController: UIViewController,UITextFieldDelegate {
    
    lazy var viewModel = PostViewModel()
    let lab = UILabel()
 

    private let addTextField: UITextField = {
        let tex = UITextField()
        tex.font = .systemFont(ofSize: 20)
        tex.backgroundColor = .white
        tex.textAlignment = .center
        tex.text = "Write here...!"
        tex.textColor = .lightGray
        return tex
    }()
    
    private let button: UIButton = {
        let  butt = UIButton()
        butt.backgroundColor = .white
        butt.setTitle("add", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.layer.cornerRadius = 10
        butt.frame = CGRect(x: 100, y: 600, width: UIScreen.main.bounds.width - 200, height: 30)
        return butt
    }()
    
    //let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField.delegate = self
        view.backgroundColor = .systemGray
        createStackview(lab: addTextField, button: button)
        buttonTap()
        configration()
        dismissButton()
    }
    func configration(){
        view.addSubview(lab)
        lab.text = "Here you can add into TodoList"
        lab.font = UIFont.boldSystemFont(ofSize: 36)
        lab.textAlignment = .center
        lab.numberOfLines = 0
        lab.adjustsFontSizeToFitWidth = true
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
        button.addTarget(self, action: #selector(didtapbutton), for: .touchUpInside)
    }
    
    @objc func didtapbutton() {
        viewModel.enteryTextfield(textField: addTextField, viewController: self)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewModel.textFieldDidBingEding(textField: addTextField)
    }
    func createStackview(lab:UITextField, button:UIButton) {
        let stackView = UIStackView(arrangedSubviews: [lab,button])
        view.addSubview(stackView)
        stackView.frame = CGRect(x: 50, y: 250, width: UIScreen.main.bounds.width - 100, height: 150)
        stackView.backgroundColor = .systemGray
        //config
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }
    func setTitleLableConstraints() {
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        lab.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        lab.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
}
