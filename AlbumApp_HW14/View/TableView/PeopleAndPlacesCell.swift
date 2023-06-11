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
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "2")
        return collectionView
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return title
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    
    var collectionViewConfig: [[String]] = [
        ["0","1","2","3"],
        ["4","5","6","7"],
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contentView)
        contentView.addSubview(collectionView)
        contentView.addSubview(title)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.topAnchor.constraint(equalTo: collectionView.topAnchor),
            image.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            image.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            image.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "2", for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewConfig.count
    }
    
    
    
    
}
