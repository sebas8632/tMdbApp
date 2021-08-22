//
//  ImageView+extension.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import Foundation
import UIKit
extension UIImageView {
    
    func setImageFrom(url: String) {
        let replaced = url.replacingOccurrences(of: "http://", with: "https:")
        let url = URL(string: replaced)
        let scale = UIScreen.main.scale
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(scale),
                .transition(.fade(1))
            ])
    }
}
