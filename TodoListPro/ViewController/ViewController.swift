//
//  ViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import UIKit

class ViewController: UIViewController{

     lazy var viewModel = TodoViewModel()

    // Create TableView anonymus clouser patern here
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifire)
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        title = "List"
        view.backgroundColor = .systemBackground
        connection()
   
    }
    
    // tableView Frame is here
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func connection() {
        viewModel.fetchTodoList()
    }
}

//MARK-> EXTENSION
extension ViewController: UITableViewDelegate,UITableViewDataSource, DoRefreshTable {
    
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifire,for: indexPath) as? TodoListTableViewCell else { fatalError() }
        cell.configure(with: viewModel.todoArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
