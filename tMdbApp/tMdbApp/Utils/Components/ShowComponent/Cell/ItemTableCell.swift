//
//  ShowComponentCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 23/08/21.
//

import UIKit

protocol CollectionDelegate {
    func showDetail(by id: Int)
}

class ItemTableCell: UITableViewCell {

    @IBOutlet weak var componentCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var actionsDelegate: CollectionDelegate?
    
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
            componentCollectionView.reloadData()
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

extension ItemTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = items?[indexPath.row] else { return }
        actionsDelegate?.showDetail(by: item.id)
    }
}
extension ItemTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.size.width / 2, height: 200.0)
    }
}
