//
//  SearchRemoteDataManagerTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import XCTest
@testable import tMdbApp
class SearchRemoteDataManagerTest: XCTestCase {
    
    var sut: SearchRemoteDataManager?
    var sessionProvider = MockSessionProvider()
    var interactor = MockSearchRemoteDataManagerOutput()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchRemoteDataManager()
        sut?.interactor = interactor
        sut?.sessionProvider = sessionProvider
    }
    
    override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut?.interactor = nil
    sut?.sessionProvider = nil
    sut = nil
    }
    
    
    func testGetMovies() {
        // Given
        let name: String = "Harry Potter"
        let page: Int = 1
        
        
        
        // When
        sessionProvider.successRequest = true
        sut?.searchMovie(by: name, page: page)
        
        //Then
        XCTAssertTrue(interactor.calls.didSearchMovie)
        XCTAssertEqual(interactor.responseMovie?.totalPages, 2)
        XCTAssertEqual(interactor.responseMovie?.totalResults, 26)
        
    }
    
    func testGetSeries() {
        // Given
        let name: String = "Game Of Thrones"
        let page: Int = 1
        
        // When
        sessionProvider.successRequest = true
        sut?.searchSerie(by: name, page: page)
        
        // Then
        XCTAssertTrue(interactor.calls.didSearchSerie)
        XCTAssertEqual(interactor.responseSerie?.totalPages, 1)
        XCTAssertEqual(interactor.responseSerie?.totalResults, 1)
        XCTAssertEqual(interactor.responseSerie?.results?.count, 1)
        XCTAssertEqual(interactor.responseSerie?.results?.first?.firstAirDate, "2011-04-17")
    }
}
