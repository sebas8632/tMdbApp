//
//  MockShowRouter.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 27/08/21.
//

import Foundation
import UIKit
@testable import tMdbApp

struct ShowRouterCalls {
    var didPresentDetail: Bool = false
}

class MockShowRouter: ShowRouterProtocol {
    
    lazy var calls = ShowRouterCalls()
    
    static func createModule() -> ShowViewController { return ShowViewController() }
    
    func presentDetail(id: Int, type: ShowType, view: UIViewController) {
        calls.didPresentDetail = true
    }
    
    
}
