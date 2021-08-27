//
//  FileManager+extension.swift
//  tMdbAppTests
//
//  Created by Juan Sebastian Florez Saavedra on 26/08/21.
//

import Foundation

extension FileManager {
    
    static func getJSONObject<T: Decodable> (from fileName: String) -> T? {
        guard let url: URL = Bundle(for: MockSessionProvider.self).url(forResource: fileName, withExtension: "json"),
              let data: Data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)

    }
}
