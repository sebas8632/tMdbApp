//
//  SearchPresenterInputTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import XCTest
@testable import tMdbApp

class SearchPresenterInputTest: XCTestCase {
    var sut: SearchPresenter?
    let interactor: MockSearchInteractorInput = MockSearchInteractorInput()
    let view: MockSearchPresenterOutput = MockSearchPresenterOutput()
    let router: MockSearchRouter = MockSearchRouter()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchPresenter()
        sut?.interactor = interactor
        sut?.router = router
        sut?.view = view
        interactor.presenter = sut
        
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.interactor = nil
        sut?.router = nil
        sut?.view = nil
        interactor.presenter = nil
        sut = SearchPresenter()
    }

    func testSearch() {
        // Given
        let type = ShowType.movie
        let query: String = "Harry Potter"
        
        // When
        sut?.search(type: type, query: query)
        
        // Then
        XCTAssertTrue(interactor.calls.didSearch)
    }
    
    func testRefreshSearch() {
        // Given
        let type = ShowType.movie
        let query: String = "Harry Potter"
        
        // When
        sut?.refreshSearch(type: type, query: query)
        
        // Then
        XCTAssertTrue(interactor.calls.didRefreshSearch)
    }
    
    func testResetData() {
        // When
        sut?.resetData()
        
        // Then
        XCTAssertEqual(sut?.actualPage, 1)
        XCTAssertEqual(sut?.movieList?.count, 0)
        XCTAssertEqual(sut?.seriesList?.count, 0)
    }
    
    func testGoToDetail() {
        // Given
        let id: Int = 545
        let type: ShowType = .movie
        
        // When
        sut?.goToDetail(id: id, type: type, view: UIViewController())
        
        // Then
        XCTAssertTrue(router.calls.didPresentDetail)
    }
}
