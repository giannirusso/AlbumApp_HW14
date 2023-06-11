//
//  PeopleAndPlacesCollectionCell.swift
//  AlbumApp_HW14
//
//  Created by D K on 11.06.2023.
//


import UIKit

class PeopleAndPlacesCollectionCell: UICollectionViewCell {
    
    lazy var imageViewOne: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageViewTwo: UIImageView = {
        let imageViewTwo = UIImageView()
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.contentMode = .scaleAspectFill
        imageViewTwo.backgroundColor = .yellow
        imageViewTwo.clipsToBounds = true
        return imageViewTwo
    }()
    
    lazy var imageViewThree: UIImageView = {
        let imageViewThree = UIImageView()
        imageViewThree.translatesAutoresizingMaskIntoConstraints = false
        imageViewThree.contentMode = .scaleAspectFill
        imageViewThree.backgroundColor = .purple
        imageViewThree.clipsToBounds = true
        return imageViewThree
    }()
    
    lazy var imageViewFour: UIImageView = {
        let imageViewFour = UIImageView()
        imageViewFour.translatesAutoresizingMaskIntoConstraints = false
        imageViewFour.contentMode = .scaleAspectFill
        imageViewFour.backgroundColor = .purple
        imageViewFour.clipsToBounds = true
        return imageViewFour
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    lazy var quantityLabel: UILabel = {
        let quantityLabel = UILabel()
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.textColor = .systemGray
        return quantityLabel
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageViewOne)
        contentView.addSubview(imageViewTwo)
        contentView.addSubview(imageViewThree)
        contentView.addSubview(imageViewFour)
        contentView.addSubview(label)
        contentView.addSubview(quantityLabel)
        
        
        NSLayoutConstraint.activate([
            
            imageViewOne.topAnchor.constraint(equalTo: topAnchor),
            imageViewOne.leftAnchor.constraint(equalTo: leftAnchor),
            imageViewOne.widthAnchor.constraint(equalToConstant: 70),
            imageViewOne.heightAnchor.constraint(equalToConstant: 70),
            
            imageViewTwo.topAnchor.constraint(equalTo: imageViewOne.bottomAnchor, constant: 10),
            imageViewTwo.leftAnchor.constraint(equalTo: leftAnchor),
            imageViewTwo.widthAnchor.constraint(equalToConstant: 70),
            imageViewTwo.heightAnchor.constraint(equalToConstant: 70),
            
            imageViewThree.topAnchor.constraint(equalTo: topAnchor),
            imageViewThree.leftAnchor.constraint(equalTo: imageViewOne.rightAnchor, constant: 10),
            imageViewThree.widthAnchor.constraint(equalToConstant: 70),
            imageViewThree.heightAnchor.constraint(equalToConstant: 70),

            imageViewFour.topAnchor.constraint(equalTo: imageViewThree.bottomAnchor, constant: 10),
            imageViewFour.leftAnchor.constraint(equalTo: imageViewTwo.rightAnchor, constant: 10),
            imageViewFour.widthAnchor.constraint(equalToConstant: 70),
            imageViewFour.heightAnchor.constraint(equalToConstant: 70),
            
            label.topAnchor.constraint(equalTo: imageViewTwo.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            label.heightAnchor.constraint(equalToConstant: 15),
            
            quantityLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            quantityLabel.leftAnchor.constraint(equalTo: label.leftAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: label.rightAnchor),
            quantityLabel.heightAnchor.constraint(equalToConstant: 15),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewOne.layer.cornerRadius = bounds.width / 4
        imageViewTwo.layer.cornerRadius = bounds.width / 4
        imageViewThree.layer.cornerRadius = bounds.width / 4
        imageViewFour.layer.cornerRadius = bounds.width / 4
    }
}


