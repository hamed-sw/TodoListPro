//
//  ViewController.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import UIKit

class ViewController: UIViewController{
    
    
    lazy var viewModel = TodoViewModel()
    let refresh = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView()
    let activityClass = AcitivityIndicator()
    let navigationConfigration = NavigationConfigration()
    
    // Create TableView anonymus clouser patern here
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TodoListTableViewCell.self,
                       forCellReuseIdentifier: TodoListTableViewCell.identifire)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        activityIndecatorshow()
        view.backgroundColor = .systemBackground
        connection()
        buttonAdding()
        navigationConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        connection()
        forRefreshing()
    }
    
    func navigationConfig() {
        navigationConfigration.navigationConfig(nav: self)
    }
    
    func activityIndecatorshow() {
        activityClass.activityIndicator(activity: activityIndicator,
                                    view: view)
    }
    
    func buttonAdding() {
        let button = UIBarButtonItem(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(addItem))
        navigationItem.rightBarButtonItems = [button]
    }
    
    @objc func addItem() {
        navigationConfigration.addItem(viewController: self)
    }
    
    func forRefreshing() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self,
                                            action: #selector(refres),
                                            for: .valueChanged)
    }
    
    @objc func refres() {
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
//MARK:- EXTENSION
extension ViewController: UITableViewDelegate,UITableViewDataSource, DoRefreshTable {
    
    func update() {
        DispatchQueue.main.async {
            self.activityClass.startActivity(activity: self.activityIndicator,
                                         view: self.view)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0,
                                              execute: {
                    self.tableView.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                    self.activityClass.stopActivity(activity: self.activityIndicator,
                                                view: self.view)
                })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifire,
                                                       for: indexPath) as? TodoListTableViewCell
        else { fatalError()
        }
        
        cell.configure(with: viewModel.todoArray[indexPath.row])
        
        cell.buttonTapCallBack = {
            self.activityClass.startActivity(activity: self.activityIndicator,
                                         view: self.view)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.activityClass.stopActivity(activity: self.activityIndicator,
                                            view: self.view)
                self.viewModel.forDeletOneByOne(indexPath: indexPath,
                                                tableView: tableView)
                self.tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.activityClass.startActivity(activity: self.activityIndicator,
                                         view: self.view)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.viewModel.forDeletOneByOne(indexPath: indexPath,
                                                tableView: tableView)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.reloadData()
                self.activityClass.stopActivity(activity: self.activityIndicator,
                                            view: self.view)
            }
        }
    }
}
