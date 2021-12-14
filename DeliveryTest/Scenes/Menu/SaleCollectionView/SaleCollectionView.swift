//
//  SaleCollectionView.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 14.12.2021.
//

import Foundation
import UIKit

class SaleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let photos: [UIImage] = [UIImage(named: "sale1")!, UIImage(named: "sale1")!, UIImage(named: "sale1")!]
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 350, height: 160)
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = .clear
        
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        
        register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.reuseID, for: indexPath) as! SaleCollectionViewCell
        cell.set(image: photos[indexPath.row])
        return cell
    }
    
    
    
    
}
