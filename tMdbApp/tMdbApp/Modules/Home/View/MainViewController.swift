//
//  MainViewController.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 20/08/21.
//

import UIKit

class MainViewController: UIViewController, HomeViewProtocol {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var seriesButton: UIButton!
    
    var presenter: HomePresenterInputProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Actions
    
    @IBAction func searchAction(_ sender: Any) {
        presenter?.goToSearchView(from: self)
    }
    
    @IBAction func moviesAction(_ sender: Any) {
        presenter?.goToMoviewView(from: self)
    }
    
    @IBAction func seriesAction(_ sender: Any) {
        presenter?.goToTVViews(from: self)
    }
}
