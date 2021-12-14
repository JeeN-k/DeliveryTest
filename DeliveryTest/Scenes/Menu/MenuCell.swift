//
//  MenuCell.swift
//  DeliveryTest
//
//  Created by Oleg Stepanov on 13.12.2021.
//

import Foundation
import UIKit

protocol MenuCellViewModel {
    var beerItem: Beer { get }
}

class MenuCell: UITableViewCell {
    static let reuseID = "MenuCell"
    
    let image: WebImageView = {
        let image = WebImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 6
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        button.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayer()
        
    }
    
    func set(beerModel: MenuCellViewModel) {
        titleLabel.text = beerModel.beerItem.name
        descriptionLabel.text = beerModel.beerItem.description
        priceButton.setTitle(String(beerModel.beerItem.abv) + "%", for: .normal)
        image.set(imageURL: beerModel.beerItem.imageUrl)
    }
    
    private func setupLayer() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceButton)
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        priceButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        priceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        priceButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
