//
//  ViewController.swift
//  CarouselEffect
//
//  Created by Atalay Aşa on 16.09.2020.
//  Copyright © 2020 Atalay Asa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Source: https://www.youtube.com/watch?v=XKXFRHctC6o
    @IBOutlet weak var collectionView: UICollectionView!
    var interests = Interests.fetchInterests()
    let cellScale: CGFloat = 0.6
    
    private var indexOfCellBeforeDragging = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = floor((view.bounds.width - cellWidth) / 2.0)
        let insetY = floor((view.bounds.height - cellHeight) / 2.0)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCell
        let interest = interests[indexPath.row]
        cell.interest = interest
        return cell
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        var indexes = self.collectionView.indexPathsForVisibleItems
        indexes.sort()
        var index = indexes.first!
        let cell = self.collectionView.cellForItem(at: index)!
        let position = self.collectionView.contentOffset.x - cell.frame.origin.x
        if position > cell.frame.size.width/2{
           index.row = index.row+1
        }
        self.collectionView.scrollToItem(at: index, at: .left, animated: true )
    }
}

