//
//  SectionsCollectionView.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 14.12.2021.
//

import Foundation
import UIKit

protocol SectionsDelegate {
    func requestToChangeSection(sectionIndex: Int)
}

class SectionsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    let sections = BeerSection.allCases
    var selected = BeerSection.less5
    var sectionDelegate: SectionsDelegate? = nil
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: 100, height: 33)
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = .clear
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        register(SectionsCollectionViewCell.self, forCellWithReuseIdentifier: SectionsCollectionViewCell.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SectionsCollectionViewCell.reuseID, for: indexPath) as! SectionsCollectionViewCell
        cell.set(section: sections[indexPath.row], selected: selected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = sections[indexPath.row]
        collectionView.reloadData()
        
        guard let sectionDelegate = sectionDelegate else { return }
        sectionDelegate.requestToChangeSection(sectionIndex: indexPath.row)

    }
    
    
    
}
