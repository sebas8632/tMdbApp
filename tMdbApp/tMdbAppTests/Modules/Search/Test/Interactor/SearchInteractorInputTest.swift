//
//  SearchInteractorTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import XCTest
@testable import tMdbApp

class SearchInteractorInputTest: XCTestCase {
    var sut: SearchInteractor?
    let presenter: MockSearchInteractorOutput = MockSearchInteractorOutput()
    let remoteDataManager: MockSearchRemoteDataManagerInput = MockSearchRemoteDataManagerInput()
    let sessionProvider = MockSessionProvider()
   
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchInteractor()
        sut?.presenter = presenter
        remoteDataManager.sessionProvider = sessionProvider
        remoteDataManager.interactor = sut
        sut?.remoteDataManager = remoteDataManager
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.presenter = nil
        sut?.remoteDataManager = nil
        sut = nil
    }


    func testSearch() {
        // Given
        let type: ShowType = .movie
        let name: String = "Harry Potter"
        let page: Int = 1
        //When
        sessionProvider.successRequest = true
        sut?.search(type: type, query: name, page: page)
        
        //Then
        XCTAssertTrue(remoteDataManager.calls.didSearchMovie)
        XCTAssertTrue(presenter.calls.didSearchMovies)
        XCTAssertEqual(presenter.movies?.count, 20)
    }

    func testRefreshSearch() {
        // Given
        let type: ShowType = .serie
        let name: String = "Friends"
        let page: Int = 2
        
        // When
        sessionProvider.successRequest = true
        remoteDataManager.isPaginating = false
        sut?.refreshSearch(type: type, query: name, page: page)
        
        // Then
        XCTAssertTrue(remoteDataManager.calls.didSearchSerie)
        XCTAssertTrue(presenter.calls.didSearchSeries)
    }
}
