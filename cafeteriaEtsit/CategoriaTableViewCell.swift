//
//  CategoriaTableViewCell.swift
//  cafeteriaEtsit
//
//  Created by Mario on 20/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class CategoriaTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
