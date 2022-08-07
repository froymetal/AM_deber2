//
//  PedidoTableViewCell.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/10/19.
//  Copyright © 2019 Academia Moviles. All rights reserved.
//

import UIKit

class PedidoTableViewCell: UITableViewCell {

    // MARK: - Constantes
    static let identifier = "PedidoTableViewCell"

    // MARK: - Propiedades
    @IBOutlet weak var cantidadLabel: UILabel!
    @IBOutlet weak var platoLabel: UILabel!
    @IBOutlet weak var precioUnitarioLabel: UILabel!
    @IBOutlet weak var precioTotalLabel: UILabel!
    
//    var detalle:PedidoDetalle! {
//        didSet {
//            cantidadLabel.text = detalle.cantidad.description
//            platoLabel.text = detalle.plato?.nombre
//            precioUnitarioLabel.text = "S/ \(detalle.plato!.precio)"
//            precioTotalLabel.text = "S/ \(detalle.precioTotal)"
//        }
//    }
}

