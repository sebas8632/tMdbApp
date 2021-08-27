//
//  SearchViewControllerTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import XCTest
@testable import tMdbApp

class SearchViewControllerTest: XCTestCase {

    var sut: SearchViewController?
    let presenter: MockSearchPresenterInput = MockSearchPresenterInput()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchViewController()
        sut?.presenter = presenter
        presenter.view = sut
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.presenter = nil
        presenter.view = nil
        sut = nil
    }

    func testOutlets() {
        
        // When
        sut?.loadViewIfNeeded()
        
        // Then
        XCTAssertNotNil(sut?.activityIndicator)
        XCTAssertNotNil(sut?.menuBar)
        XCTAssertNotNil(sut?.searchBar)
    }
    
    func testDidSelectRow() {
        
        // Given
        presenter.movieList = [MovieModel(id: 2384, title: "Pelicula Prueba", posterPath: nil, releaseDate: "2020/01/05", voteAverage: nil)]
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        sut?.tableView(tableView, didSelectRowAt: indexPath)
        
        // Then
        XCTAssertTrue(presenter.calls.didGoToDetail)
    }
    
    func testSearch() {
        // Given
        let searchBar = UISearchBar()
        searchBar.text = "Harry Potter"
        
        // When
        sut?.searchBarTextDidEndEditing(searchBar)
        
        // Then
        XCTAssertTrue(presenter.calls.didSearch)
    }
    
}
