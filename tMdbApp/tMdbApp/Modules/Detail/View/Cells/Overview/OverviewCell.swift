//
//  OverviewCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import UIKit

class OverviewCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var overviewInfo: String? {
        didSet {
            overviewLabel.text = !(overviewInfo?.isEmpty ?? false) ? overviewInfo : "NO OVERVIEW"
        }
    }
}
