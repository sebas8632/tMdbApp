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
    
    func getImage(posterPath: String?) {
        if let posterPath = posterPath {
            let path: String = "\(NetworkConstants.imageBaseURL)\(posterPath)"
            self.setImageFrom(url: path)
        } else {
            self.image = UIImage(named: "image_not_found")
        }
    }
    
    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.systemBackground.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
