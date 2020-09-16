//
//  InterestCell.swift
//  CarouselEffect
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class InterestCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var textLbl: UILabel!
    
    var interest: Interests! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let interest = interest {
            featuredImageView.image = interest.image
            textLbl.text = interest.title
            bgView.backgroundColor = interest.color
        } else {
            featuredImageView.image = nil
            textLbl.text = nil
            bgView.backgroundColor = nil
        }
        
        bgView.layer.cornerRadius = 10
        bgView?.layer.masksToBounds = true
        
        featuredImageView.layer.cornerRadius = 10
        featuredImageView.layer.masksToBounds = true
    }
}
