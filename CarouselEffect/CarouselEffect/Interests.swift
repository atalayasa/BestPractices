//
//  Interests.swift
//  CarouselEffect
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class Interests {
    let title: String
    let image: UIImage
    let color: UIColor
    
    init(title: String, image: UIImage, color: UIColor) {
        self.title = title
        self.image = image
        self.color = color
    }
    
    static func fetchInterests() -> [Interests] {
        return [Interests(title: "Travelling Around The World",
                          image: UIImage(named: "1")!,
                          color: .systemPink),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "2")!,
                          color: .systemBlue),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "3")!,
                          color: .systemTeal),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "1")!,
                          color: .systemPurple),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "2")!,
                          color: .systemYellow),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "3")!,
                          color: .systemPink),
                Interests(title: "Travelling Around The World",
                          image: UIImage(named: "2")!,
                          color: .systemOrange)]
    }
    
}
