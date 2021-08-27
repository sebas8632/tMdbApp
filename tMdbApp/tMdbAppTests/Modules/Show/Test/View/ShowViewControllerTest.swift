//
//  ShowViewControllerTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import XCTest
@testable import tMdbApp

class ShowViewControllerTest: XCTestCase {
    
    var sut: ShowViewController?
    let presenter = MockShowPresenterInput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ShowViewController()
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
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.menuBar)
        XCTAssertNotNil(sut?.showComponentView)
    }

    func testViewDidLoad() {
        // When
        sut?.loadViewIfNeeded()
        
        // Then
        XCTAssertTrue(presenter.calls.didGetMovies)
    }
    
    func testHeighForRow() {
        // Given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let height = sut?.tableView(tableView, heightForRowAt: indexPath)
        
        // Then
        XCTAssertEqual(height, 260)
    }
}
