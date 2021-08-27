//
//  MovieTableViewCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import UIKit
import Kingfisher
class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var info: ShowContentProtocol? {
        didSet {
            titleLabel.text = info?.title
            releaseDateLabel.text = info?.date
            voteAverageLabel.text = info?.voteAverage != nil ? "\(info?.voteAverage ?? 0)" : "N/A"
            posterImageView.getImage(posterPath: info?.imagePath)
        }
    }
}
