//
//  ShowCollectionCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 23/08/21.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var model: ShowContentProtocol? {
        didSet {
            let vote = model?.voteAverage != nil ? "\(model?.voteAverage ?? 0)" : "N/A"
            titleLabel.text = model?.title
            voteLabel.text = vote
            dateLabel.text = model?.date
            showImageView.getImage(posterPath: model?.imagePath)
        }
    }

}
