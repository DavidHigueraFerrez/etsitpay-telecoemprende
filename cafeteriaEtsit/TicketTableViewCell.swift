//
//  TicketTableViewCell.swift
//  cafeteriaEtsit
//
//  Created by Mario on 22/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet weak var producto: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var borrar: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
