//
//  DetailViewController.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 24/08/21.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    @IBOutlet weak var detailTableView: UITableView!
    
    var activityIndicator: UIActivityIndicatorView?
    
    var presenter: DetailPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        createActivityIndicator()
        activityIndicator?.startAnimating()
        presenter?.viewDidLoad()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        
    }
    
    private func configTableView() {
        detailTableView.register(UINib(nibName: "MainInfoCell", bundle: nil), forCellReuseIdentifier: "MainInfoCell")
        detailTableView.register(UINib(nibName: "OverviewCell", bundle: nil), forCellReuseIdentifier: "OverviewCell")
        detailTableView.dataSource = self
    }
    
    private func createActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        view.addSubview(activityIndicator!)
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.detailItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.detailItems?[section].rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let items = presenter?.detailItems else { return UITableViewCell()}
        let type: DetailViewModelItemType = items[indexPath.section].type
        
        switch type {
        case .mainInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainInfoCell") as! MainInfoCell
            let mainInfoItem = items[indexPath.section] as! MainInfoViewModelItem
            cell.info = mainInfoItem
            return cell
            
        case .overview:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewCell") as! OverviewCell
            let overview: OverviewViewModelItem = items[indexPath.section] as! OverviewViewModelItem
            cell.overviewInfo = overview.overview
            return cell
            
        case .genres:
            let cell = UITableViewCell()
            let genres = items[indexPath.section] as! GenresViewModelItem
            cell.textLabel?.text = genres.genres?[indexPath.row]
            return cell
            
        case .companies:
            let cell = UITableViewCell()
            let companies = items[indexPath.section] as! CompaniesViewModelItem
            cell.textLabel?.text = companies.companies?[indexPath.row]
            return cell

        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.detailItems?[section].sectionTitle
    }
    
    
}

extension DetailViewController: DetailPresenterOutputProtocol {
    func updateData() {
        DispatchQueue.main.async {[weak self] in
            self?.detailTableView.reloadData()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            self?.activityIndicator?.stopAnimating()

        }
    }
    
}
