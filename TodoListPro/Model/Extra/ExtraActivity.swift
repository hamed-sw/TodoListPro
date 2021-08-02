//
//  ExtraActivity.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 02.08.2021.
//

import UIKit

class AcitivityIndicator  {
    
    
    func activityIndicator(activity: UIActivityIndicatorView, view: UIView) {
        activity.center = view.center
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.color = UIColor.black
        view.addSubview(activity)
    }
    
    func startActivity(activity: UIActivityIndicatorView, view: UIView) {
        activity.startAnimating()
        view.isUserInteractionEnabled = false
    }
    func stopActivity(activity: UIActivityIndicatorView, view: UIView) {
        activity.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
}

class NavigationConfigration {
    
    func navigationConfig(nav: UIViewController) {
        nav.title = "List"
        let nadv = nav.navigationController?.navigationBar
        nadv?.backgroundColor = .gray
    }
  
    func addItem(viewController: UIViewController){
        let vc = AddInToTodoListViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        viewController.present(navVC, animated: true)
    }
}
