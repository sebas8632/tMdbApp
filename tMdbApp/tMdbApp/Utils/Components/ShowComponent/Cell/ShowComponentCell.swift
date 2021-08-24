//
//  ShowComponentCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 23/08/21.
//

import UIKit

class ItemTableCell: UITableViewCell {

    @IBOutlet weak var componentCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var items: [ShowContentProtocol]?
    var category: SearchCategory?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension ItemTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items?[indexPath.row]
        switch category {
        case .popular:
            titleLabel.text = "Popular"
        case .topRated:
            titleLabel.text = "Top Rated"
        case .upcoming:
            titleLabel.text = "Upcoming"
        case .none:
            titleLabel.text = "None"
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionCell", for: indexPath) as! ItemCollectionCell
        
        return cell
    }
    
    
}
