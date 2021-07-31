//
//  ViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import UIKit

class ViewController: UIViewController{
    

     lazy var viewModel = TodoViewModel()
    let indicator = UIActivityIndicatorView(style: .large)
    let refresh = UIRefreshControl()

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
        view.backgroundColor = .systemBackground
        connection()
        buttonAdding()
        forRefreshing()
        navigationConfig()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        connection()
    }

    func navigationConfig() {
        title = "List"
        let nav = navigationController?.navigationBar
        nav?.backgroundColor = .gray
    }

    
    func buttonAdding() {
       let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
       
        navigationItem.rightBarButtonItems = [button]
       // forRefreshing()

    }
    @objc func addItem() {
//        viewModel.forAddingIntoTodoList(viewController: self)
//        forRefreshing()
        let vc = AddInToTodoListViewController()
       // let navVC = UINavigationController(rootViewController: vc)
        //navVC.modalPresentationStyle = .fullScreen
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    func forRefreshing() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refres), for: .valueChanged)

    }
    @objc func refres() {
        connection()
        //viewModel.refresh(tableView: tableView)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.tableView.backgroundView = self.indicator
//
//            self.refresh.beginRefreshing()
//            self.tableView.refreshControl?.endRefreshing()
//            self.tableView.reloadData()
//            self.connection()
//        }
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

//MARK:- EXTENSION
extension ViewController: UITableViewDelegate,UITableViewDataSource, DoRefreshTable {
    
    func update() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             let index = viewModel.todoArray[indexPath.row].subName
            let theDeletOpetion = viewModel.takeIdFromUrl(at: index)
            self.viewModel.deleteFormList(the: theDeletOpetion)
            self.viewModel.todoArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
    }
}
