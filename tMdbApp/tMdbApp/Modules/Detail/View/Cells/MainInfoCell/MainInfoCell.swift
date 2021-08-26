//
//  GeneralInfoCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 25/08/21.
//

import UIKit

class MainInfoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!

    var info: MainInfoViewModelItem? {
        didSet {
            let vote = info?.voteAverage != nil ? "\(info?.voteAverage ?? 0)" : "N/A"
            let tagline: String = info?.tagline != nil ? (info?.tagline ?? "NO TAGLINE" ) : "NO TAGLINE"
            titleLabel.text = info?.title
            taglineLabel.text = !tagline.isEmpty ? tagline : "NO TAGLINE"
            dateLabel.text = info?.releaseDate ?? "NO RELEASE DATE"
            voteLabel.text = vote
            posterImage.getImage(posterPath: info?.posterPath)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
