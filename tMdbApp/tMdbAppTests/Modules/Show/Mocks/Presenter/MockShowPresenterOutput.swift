//
//  MockShowPresenterOutput.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
import UIKit
@testable import tMdbApp

struct ShowPresenterOutputCalls {
    var didUpdateInitialData: Bool = false
}

class MockShowPresenterOutput: ShowPresenterOutputProtocol {
    
    lazy var calls = ShowPresenterOutputCalls()
    
    func updateInitialData(type: ShowType) {
        calls.didUpdateInitialData = true
    }
    
    
}
