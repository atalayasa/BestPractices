//
//  MasterVC.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import UIKit

final class MasterVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindView()
    }
}

private extension MasterVC {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MasterCell.self, forCellReuseIdentifier: MasterCell.identifier)
    }
    func bindView() {
        viewModel.reloadTable = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.getFollowers()
    }
}
extension MasterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MasterCell.identifier) as? MasterCell else { return UITableViewCell() }
        let follower = viewModel.followers[indexPath.row]
        cell.textLabel?.text = follower.loginName
        cell.detailTextLabel?.text = "\(follower.userId)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let follower = viewModel.followers[indexPath.row]
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil, follower: follower)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
