//
//  MenuBarCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import UIKit

class MenuBarCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underView: UIView!

    var highlight: Bool? {
        didSet {
            guard let highlight = highlight else { return }
            if highlight  {
                self.underView.isHidden = false
            } else {
                self.underView.isHidden = true
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
