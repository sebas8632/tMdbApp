//
//  ShowPresenterTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import XCTest
@testable import tMdbApp
class ShowPresenterTest: XCTestCase {
    
    var sut: ShowPresenter?
    let interactor = MockShowInteractorInput()
    let router = MockShowRouter()
    let view = MockShowPresenterOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ShowPresenter()
        sut?.interactor = interactor
        interactor.presenter = sut
        sut?.router = router
        sut?.view = view
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.interactor = nil
        interactor.presenter = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil

    }
    
    func testGetMovies() {
        
        sut?.getMovies()
        XCTAssertTrue(interactor.calls.didGetMovies)
        XCTAssertNotNil(sut?.populars)
        XCTAssertEqual(sut?.populars?.count, 1)
    }
    
    func testGoToDetail() {
        // Given
        let id: Int = 454
        let type: ShowType = .movie
        
        // When
        sut?.goToDetail(id: id, type: type, view: UIViewController())
        
        // Then
        XCTAssertTrue(router.calls.didPresentDetail)
    }
}
