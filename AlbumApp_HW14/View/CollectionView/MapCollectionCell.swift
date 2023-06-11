//
//  MapCollectionCell.swift
//  AlbumApp_HW14
//
//  Created by D K on 11.06.2023.
//

import UIKit

class MapCollectionCell: UICollectionViewCell {
    
/* создать клоужер ячейки коллекции со свойствами
 var imageName: String
 var title: String
 var numberOfPhotos: Int
*/
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .purple
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Everest"
        return label
        
    }()
    
    
    lazy var quantityLabel: UILabel = {
        let quantityLabel = UILabel()
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.text = "300"
        quantityLabel.textColor = .systemGray
        return quantityLabel
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(quantityLabel)
        contentView.backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
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
        imageView.layer.cornerRadius = bounds.width / 2
    }
}


