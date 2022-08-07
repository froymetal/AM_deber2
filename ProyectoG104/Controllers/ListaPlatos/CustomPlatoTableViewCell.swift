//
//  CustomPlatoTableViewCell.swift
//  ProyectoG104
//
//  Created by fredyM1 on 27/07/22.
//

import UIKit

class CustomPlatoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenCell: UIImageView!
    @IBOutlet weak var nombreCell: UILabel!
    @IBOutlet weak var descripcionCell: UILabel!
    @IBOutlet weak var precioCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
