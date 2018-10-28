//
//  TotalTableViewCell.swift
//  cafeteriaEtsit
//
//  Created by Mario on 29/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {

    @IBOutlet weak var importeTotal: UILabel!
    @IBOutlet weak var textoTotal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
