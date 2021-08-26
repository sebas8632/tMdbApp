//
//  DatesOnAirCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import UIKit

class DatesOnAirCell: UITableViewCell {

    @IBOutlet weak var firstAirLabel: UILabel!
    @IBOutlet weak var lastAirLabel: UILabel!
    
    var datesOnAir: DatesOnAirViewModelItem? {
        didSet {
            firstAirLabel.text = datesOnAir?.firstAirDate
            lastAirLabel.text = datesOnAir?.lasAirDate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
