//
//  ViewController.swift
//  AlbumApp_HW14
//
//  Created by D K on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
//   создание таблицы - фундамента
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .orange
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "1")
        return tableView
    }()
    
    lazy var cellContainer
// данные для ячеек (ЯЧЕЕК ЕЩË НЕТ!)
    var cellConfig: [[String]] = [
        ["0","1","2","3"],
        ["4","5","6","7"],
        ["8","9","10","11"]
    ]
    

//    collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    
        ])

    }


}
// кол-во строк  в СЕКЦИИ
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellConfig[section].count
    }
//    обращение к ячейке, воз-ет ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellTitle = cellConfig[indexPath.section][indexPath.item]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "1")
        
        cell?.textLabel?.text = cellTitle
        print(cellTitle)
        return cell!
    }
//    кол-во секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellConfig.count
    }

}

