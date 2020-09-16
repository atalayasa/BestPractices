//
//  ViewController.swift
//  SlideUpMenu
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var transparentView = UIView()
//    var tableView = UITableView()
    var menuVC = MenuTable()
    let height: CGFloat = 250
    let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func menuBtnPressed(_ sender: Any) {
        // Added black view above view
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        transparentView.frame = view.frame
        navigationController?.view.addSubview(transparentView)
        
        // Added table view
        
        
        navigationController?.addChild(menuVC)
        menuVC.view.frame = CGRect(x: 0,
                                   y: screenSize.height,
                                   width: screenSize.width,
                                   height: 250)
        navigationController?.view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        // added tap gesture to transparent view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(transparentViewPressed))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
                        self.transparentView.alpha = 0.5
                        self.menuVC.view.frame = CGRect(x: 0,
                                                      y: self.screenSize.height - self.height,
                                                      width: self.screenSize.width,
                                                      height: self.height)
        }, completion: nil)
        
    }
    
    @objc func transparentViewPressed() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
                        self.transparentView.alpha = 0
                        self.menuVC.view.frame = CGRect(x: 0,
                                                      y: self.screenSize.height,
                                                      width: self.screenSize.width,
                                                      height: self.height)
        }, completion: nil)
    }
}

