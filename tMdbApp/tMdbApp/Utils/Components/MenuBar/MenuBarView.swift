//
//  MenuBarView.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 22/08/21.
//

import UIKit

protocol MenuBarDelegate {
    func menuActions(index: Int)
}

class MenuBarView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var menuCollection: UICollectionView!
    
    var delegate: MenuBarDelegate?
    
    var items: [String]? {
        didSet {
            menuCollection.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("MenuBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        menuCollection.register(UINib(nibName: "MenuBarCell", bundle: nil), forCellWithReuseIdentifier: "MenuBarCell")
        menuCollection.dataSource = self
        menuCollection.delegate = self
        
    }
}

extension MenuBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = items?[indexPath.row] else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuBarCell", for: indexPath) as! MenuBarCell
        cell.titleLabel.text = item
        cell.underView.backgroundColor = .systemBlue
        
        if indexPath.row == 0 {
            cell.underView.isHidden = false
        }
        return cell
    }
}

extension MenuBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuBarCell
        cell.highlight = true
        guard let delegate = self.delegate else { return }
        delegate.menuActions(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuBarCell
        cell.highlight = false
    }
}

