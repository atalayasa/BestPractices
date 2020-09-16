//
//  CustomCell.swift
//  SlideUpMenu
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
