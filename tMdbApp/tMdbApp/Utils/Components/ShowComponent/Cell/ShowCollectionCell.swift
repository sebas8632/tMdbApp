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
            titleLabel.text = model?.title
            voteLabel.text = "\(model?.voteAverage) / 5.0"
            dateLabel.text = model?.date
            
        }
    }

}
