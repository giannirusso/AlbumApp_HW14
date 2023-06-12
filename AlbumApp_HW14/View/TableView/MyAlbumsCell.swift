//
//  MyAlbumsCell.swift
//  AlbumApp_HW14
//
//  Created by D K on 10.06.2023.
//

import UIKit

class MyAlbumsCell: UITableViewCell {
   
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 150, height: 150)
        layout.sectionInset = .init(top: 0, left: 16, bottom: 60, right: 16)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MyAlbumsCollectionCell.self, forCellWithReuseIdentifier: "2")
        return collectionView
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "My Albums"
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return title
    }()

    
    var collectionViewConfig: [[CollectionViewModel]] = [
        [
            CollectionViewModel(imageName: "1", title: "First", numberOfPhotos: 100),
            CollectionViewModel(imageName: "2", title: "Second", numberOfPhotos: 200),
            CollectionViewModel(imageName: "3", title: "Third", numberOfPhotos: 300),
            CollectionViewModel(imageName: "4", title: "Fourth", numberOfPhotos: 400),
            CollectionViewModel(imageName: "5", title: "Fifth", numberOfPhotos: 500),
            CollectionViewModel(imageName: "6", title: "Six", numberOfPhotos: 600),
            CollectionViewModel(imageName: "7", title: "Seven", numberOfPhotos: 700),
            CollectionViewModel(imageName: "8", title: "Eight", numberOfPhotos: 800),
            CollectionViewModel(imageName: "9", title: "Nine", numberOfPhotos: 900),
            CollectionViewModel(imageName: "10", title: "Ten", numberOfPhotos: 1000),
        ]
        
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

extension MyAlbumsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewConfig[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellModel = collectionViewConfig[indexPath.section][indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "2", for: indexPath) as? MyAlbumsCollectionCell
        cell?.backgroundColor = .systemBackground
        cell?.label.text = cellModel.title
        cell?.quantityLabel.text = String(cellModel.numberOfPhotos)
        cell?.imageView.image = UIImage(named: cellModel.imageName)
        
        return cell!
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewConfig.count
    }
    
    
    
    
}
