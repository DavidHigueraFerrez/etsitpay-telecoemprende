//
//  ProductosTableViewCell.swift
//  cafeteriaEtsit
//
//  Created by Mario on 22/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class ProductosTableViewCell: UITableViewCell {

    @IBOutlet weak var precioProducto: UILabel!
    @IBOutlet weak var nombreProducto: UILabel!
    @IBAction func añadirPulsado(_ sender: Any) {
    }
    @IBOutlet weak var añadirBoton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
