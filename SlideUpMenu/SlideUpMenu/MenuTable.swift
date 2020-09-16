//
//  MenuTable.swift
//  SlideUpMenu
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class MenuTable: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell else { fatalError() }
        cell.textLabel?.text = "Atalay"
        cell.imageView?.image = UIImage(systemName: "calendar.circle")
        return cell
    }
}
