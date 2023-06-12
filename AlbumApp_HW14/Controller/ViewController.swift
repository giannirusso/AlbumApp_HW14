//
//  ViewController.swift
//  AlbumApp_HW14
//
//  Created by D K on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
//   создание таблицы - фундамента
    lazy var mainLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Albums"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(MyAlbumsCell.self, forCellReuseIdentifier: "1")
        tableView.register(PeopleAndPlacesCell.self, forCellReuseIdentifier: "2")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "3")
        tableView.delegate = self
        return tableView
    }()
    
// данные для ячеек (ЯЧЕЕК ЕЩË НЕТ!)
    var cellConfig: [[DefaultCellModel]] = [
        [
            DefaultCellModel(title: "Airplane Mode", image: UIImage(systemName: "airplane")!, type: .switchCell, secText: nil),
            DefaultCellModel(title: "Wi-Fi", image: UIImage(systemName: "wifi.circle.fill")!, type: .accessoryLabelCell, secText: "Not Connected"),
            DefaultCellModel(title: "Bluetooth", image: UIImage(systemName: "chevron.forward.to.line")!, type: .accessoryLabelCell, secText: "Off"),
            DefaultCellModel(title: "Mobile Data", image: UIImage(systemName: "antenna.radiowaves.left.and.right")!, type: .accessoryLabelCell, secText: "Off"),
            DefaultCellModel(title: "Personal Hotspot", image: UIImage(systemName: "personalhotspot")!, type: .accessoryLabelCell, secText: "Off"),
            DefaultCellModel(title: "VPN", image: UIImage(systemName: "v.circle.fill")!, type: .accessoryLabelCell, secText: "Not Connected"),],
        [],
        [],
    ]
    

//    collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainLabel)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            mainLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            tableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    
        ])

    }


}
// кол-во строк  в СЕКЦИИ
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellConfig[section].count
    }
//    обращение к ячейке, воз-ет ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTitle = cellConfig[indexPath.section][indexPath.item]
        
        if indexPath.section == 0 && indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "1") as? MyAlbumsCell
            cell?.textLabel?.isUserInteractionEnabled = false
            return cell!
        }
        
        if indexPath.section == 0 && indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "2") as? PeopleAndPlacesCell
            cell?.textLabel?.isUserInteractionEnabled = false
            return cell!
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "3")
        cell?.backgroundColor = .systemBackground
//        cell?.textLabel?.text = cellTitle
        return cell!
    }
//    кол-во секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellConfig.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 && indexPath.section == 0 {
            return 500
        }
        if indexPath.item == 1 && indexPath.section == 0 {
            return 350
        }
        return 20
    }
    
    
}

