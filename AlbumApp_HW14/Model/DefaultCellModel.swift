//
//  DefaulCellModel.swift
//  AlbumApp_HW14
//
//  Created by D K on 12.06.2023.
//

import UIKit

struct DefaultCellModel {
    let title: String
    let image: UIImage
    let type: CellType
    let secText: String?
}

enum CellType {
    case switchCell
    case defaultCell
    case accessoryLabelCell
}

