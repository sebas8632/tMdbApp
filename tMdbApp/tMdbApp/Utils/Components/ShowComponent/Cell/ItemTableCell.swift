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
    var category: SearchCategory? {
        didSet {
            switch category {
            case .popular:
                titleLabel.text = "Popular"
            case .topRated:
                titleLabel.text = "Top Rated"
            default:
                titleLabel.text = "Upcoming"
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        componentCollectionView.register(UINib(nibName: "ItemCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionCell")
        componentCollectionView.dataSource = self
        componentCollectionView.delegate = self
    }
}

extension ItemTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionCell", for: indexPath) as! ItemCollectionCell
        cell.model = item
        return cell
    }
    
}

extension ItemTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.size.width / 2, height: 200.0)
    }
}
