//
//  TodoListTableViewCell.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    // register our cell to the table
    static let identifire = "TodoListTableViewCell"
    var buttonTapCallBack: () -> () = {}
    
    // create Label for todoList
    private let todoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    // create Label for todoList
    private let subName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        
        return label
    }()
    
    private let button: UIButton = {
        let buttton = UIButton()
        buttton.setTitleColor(.black, for: .normal)
        buttton.setImage(UIImage(systemName: "trash"), for: .normal)
        return buttton
    }()
    
    // initionalize the table for the tableview
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // all supview add to in content view
        contentView.addSubview(todoLabel)
        contentView.addSubview(subName)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc private func tapButton() {
        print("i am tap ")
        buttonTapCallBack()
    }
    
    
    // need for requird Initializer
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // we want to leyout our subview
    override func layoutSubviews() {
        super.layoutSubviews()
        todoLabel.frame = CGRect(x: 10,
                                 y: 5,
                                 width: contentView.frame.size.width - 170,
                                 height: 60)
        
        subName.frame = CGRect(x: 10,
                               y: 70,
                               width: contentView.frame.size.width - 170,
                               height: contentView.frame.size.height/2)
        
        button.frame = CGRect(x: contentView.frame.size.width - 50,
                              y: 15,
                              width: 30,
                              height: 40)
    }
    
    //prepar the cell for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        todoLabel.text = nil
    }
    
    func configure(with viewModel: CellViewModel) {
        
        todoLabel.text = viewModel.name
        //subName.text = viewModel.subName
    }
}
