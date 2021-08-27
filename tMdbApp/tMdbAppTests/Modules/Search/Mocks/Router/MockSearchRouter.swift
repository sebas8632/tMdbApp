//
//  MockSearchRouter.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation
import UIKit
@testable import tMdbApp

struct SearchRouterCalls {
    var didPresentDetail: Bool = false
}
class MockSearchRouter: SearchRouterProtocol {
    
    lazy var calls = SearchRouterCalls()
    static func createModule() -> SearchViewController {
        return SearchViewController()
    }
    
    func presentDetail(id: Int, type: ShowType, view: UIViewController) {
        calls.didPresentDetail = true
    }
    
    
}
