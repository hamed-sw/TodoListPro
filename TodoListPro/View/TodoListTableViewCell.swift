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
    
    // initionalize the table for the tableview
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // all supview add to in content view
        contentView.addSubview(todoLabel)
        contentView.addSubview(subName)
    }
    
    // need for requird Initializer
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // we want to leyout our subview
    override func layoutSubviews() {
        super.layoutSubviews()
        todoLabel.frame = CGRect(x: 10,
                                 y: 0,
                                 width: contentView.frame.size.width - 170,
                                 height: 70)
        
        subName.frame = CGRect(x: 10,
                               y: 70,
                               width: contentView.frame.size.width - 170,
                               height: contentView.frame.size.height/2)
    }
    
    //prepar the cell for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        todoLabel.text = nil
    }
    
    func configure(with viewModel: CellViewModel) {
        
        todoLabel.text = viewModel.name
        subName.text = viewModel.subName
    }
}
