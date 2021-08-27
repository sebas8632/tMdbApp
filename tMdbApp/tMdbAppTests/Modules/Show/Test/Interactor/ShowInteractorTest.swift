//
//  ShowInteractorTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import XCTest
@testable import tMdbApp

class ShowInteractorTest: XCTestCase {
    
    var sut: ShowInteractor?
    let remoteDataManager = MockShowRemoteDataManagerInput()
    var presenter = MockShowInteractorOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ShowInteractor()
        sut?.remoteDataManager = remoteDataManager
        remoteDataManager.sessionProvider = MockShowSessionProvider()
        remoteDataManager.interactor = sut
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.remoteDataManager = nil
        remoteDataManager.interactor = nil
        sut?.presenter = nil
        sut = nil
    }

    func testGetMovies() {
        
        // Given
        let expectation = self.expectation(description: "Fetching movies")
        
        // When
        sut?.getMovies()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        // Then
        
        XCTAssertTrue(remoteDataManager.calls.didSearchPopularMovies)
        XCTAssertTrue(remoteDataManager.calls.didSearchTopRatedMovies)
        XCTAssertTrue(remoteDataManager.calls.didSearchUpcomingMovies)
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.calls.didGetMovies)
        XCTAssertNotNil(presenter.popularMovies)

    }

}
