//
//  SeasonInfoCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import UIKit

class SeasonInfoCell: UITableViewCell {
    @IBOutlet weak var numberOfSeasonLabel: UILabel!
    @IBOutlet weak var numberOfEpisodes: UILabel!
    
    
    var info: SeasonInfoViewModelItem? {
        didSet {
            guard let seasons = info?.numberOfSeasons, let episodes = info?.numberOfEpisodes else { return }
            numberOfSeasonLabel.text = "\(seasons)"
            numberOfEpisodes.text = "\(episodes)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
