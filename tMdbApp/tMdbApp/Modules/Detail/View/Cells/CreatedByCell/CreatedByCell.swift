//
//  CreatedByCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import UIKit

class CreatedByCell: UITableViewCell {

    @IBOutlet weak var createdCollectionView: UICollectionView!
    
    var item: CreatedByViewModelItem? {
        didSet {
            createdCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createdCollectionView.register(UINib(nibName: "CreatedCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CreatedCollectionCell")
        createdCollectionView.dataSource = self
    }

}

extension CreatedByCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.creators?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatedCollectionCell", for: indexPath) as! CreatedCollectionCell
        cell.creator = item?.creators?[indexPath.row]
        return cell
    }
}
