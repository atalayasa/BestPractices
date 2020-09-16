//
//  MasterCell.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import UIKit

final class MasterCell: UITableViewCell {
    static let identifier: String = "MasterCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

