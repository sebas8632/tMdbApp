//
//  MockSearchPresenterOutpul.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
@testable import tMdbApp

struct SearchPresenterOutputCalls {
    var didUpdateTable: Bool = false
}
class MockSearchPresenterOutput: SearchPresenterOutputProtocol {
    
    lazy var calls = SearchPresenterOutputCalls()
    
    func updateTable() {
        calls.didUpdateTable = true
    }
    
    
}
