//
//  DetailVC.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    
    @IBOutlet private weak var followersURLLbl: UILabel!
    @IBOutlet private weak var followingURLLbl: UILabel!
    @IBOutlet private weak var reposURLLbl: UILabel!
    private let follower: Follower
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, follower: Follower) {
        self.follower = follower
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        followersURLLbl.text = follower.followersUrl.absoluteString
        followingURLLbl.text = follower.organizationsUrl.absoluteString
        reposURLLbl.text = follower.reposUrl.absoluteString
    }
    
    
}
