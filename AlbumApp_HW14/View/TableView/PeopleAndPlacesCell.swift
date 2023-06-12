//
//  PeopleAndPlacesCell.swift
//  AlbumApp_HW14
//
//  Created by D K on 11.06.2023.
//

import UIKit

class PeopleAndPlacesCell: UITableViewCell {
   
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 150, height: 150)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 60, right: 16)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PeopleAndPlacesCollectionCell.self, forCellWithReuseIdentifier: "2")
        return collectionView
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "People & Places"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return title
    }()
    
    var collectionViewConfig: [[CollectionViewModel]] = [
        
        [
            CollectionViewModel(imageName: "ava1", title: "People", numberOfPhotos: 1),
        ],
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        contentView.addSubview(collectionView)


        
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            title.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PeopleAndPlacesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewConfig[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellModel = collectionViewConfig[indexPath.section][indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "2", for: indexPath) as? PeopleAndPlacesCollectionCell
        cell?.backgroundColor = .systemBackground
        cell?.label.text = cellModel.title
        cell?.quantityLabel.text = String(cellModel.numberOfPhotos)
        cell?.imageViewOne.image = UIImage(named: cellModel.imageName)
        cell?.imageViewTwo.image = UIImage(named: cellModel.imageName)
        cell?.imageViewThree.image = UIImage(named: cellModel.imageName)
        cell?.imageViewFour.image = UIImage(named: cellModel.imageName)
        
        return cell!
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewConfig.count
    }
    
    
    
    
}
