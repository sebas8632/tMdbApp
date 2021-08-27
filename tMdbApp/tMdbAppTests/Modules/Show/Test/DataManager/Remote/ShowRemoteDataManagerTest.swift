//
//  ShowRemoteDataManagerInputTest.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import XCTest
import JSFSNetwork
@testable import tMdbApp

class ShowRemoteDataManagerTest: XCTestCase {
    
    var sut: ShowRemoteDataManager?
    let sessionProvider = MockShowSessionProvider()
    var interactor = MockShowRemoteDataManagerOutput()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ShowRemoteDataManager()
        sut?.interactor = interactor
        sut?.sessionProvider = sessionProvider
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut?.interactor = nil
        sut?.sessionProvider = nil
        sut = nil
    }

    func testSearchPopularMovies() {
        // Given
        let group = DispatchGroup()
        group.enter()
        // When
        sut?.searchPopularMovies(group: group)
        
        // Then
        XCTAssertTrue(interactor.calls.didSearchPopularMovies)
        XCTAssertEqual(interactor.popularMovies?.count, 20)
        
    }
    
    func testSearchTopRatedMovies() {
        // Given
        let group = DispatchGroup()
        group.enter()
        
        // When
        sut?.searchTopRatedMovies(group: group)
        
        // Then
        XCTAssertTrue(interactor.calls.didSearchTopRatedMovies)
        XCTAssertEqual(interactor.topRatedMovies?.count, 20)
    }
    
    func testSearchUpcomingMovies() {
        // Given
        let group = DispatchGroup()
        group.enter()
        
        // When
        sut?.searchUpcomingMovies(group: group)
        
        // Then
        XCTAssertTrue(interactor.calls.didSearchUpcomingMovies)
        XCTAssertEqual(interactor.upcomingMovies?.count, 20)
        
    }
}
