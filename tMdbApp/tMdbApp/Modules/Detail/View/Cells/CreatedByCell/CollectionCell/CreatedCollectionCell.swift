//
//  CreatedCollectionCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import UIKit

class CreatedCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var creator: CreatorModel? {
        didSet {
            imageView.getImage(posterPath: creator?.profilePath)
            nameLabel.text = creator?.name ?? "No Name"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.makeRounded()
        
    }

}
