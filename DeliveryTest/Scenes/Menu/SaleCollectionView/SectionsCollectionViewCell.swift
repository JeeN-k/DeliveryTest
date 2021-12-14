//
//  SectionsCollectionViewCell.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 14.12.2021.
//

import Foundation
import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    static let reuseID = "SectionsCollectionViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    
    func set(section: BeerSection, selected: BeerSection) {
        label.text = section.rawValue
        if section == selected {
            label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            label.textColor = #colorLiteral(red: 0.8662880063, green: 0.7896884084, blue: 0.8222396374, alpha: 1)
            label.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
    
    override func prepareForReuse() {
        label.backgroundColor = .clear
        label.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        addSubview(label)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
