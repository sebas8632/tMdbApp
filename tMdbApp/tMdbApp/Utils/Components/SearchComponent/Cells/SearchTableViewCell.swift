//
//  MovieTableViewCell.swift
//  tMdbApp
//
//  Created by Juan Sebastian Florez Saavedra on 21/08/21.
//

import UIKit
import Kingfisher
class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var movieInfo: SearchMovieModel? {
        didSet {
            titleLabel.text = movieInfo?.title
            releaseDateLabel.text = movieInfo?.releaseDate
            voteAverageLabel.text = movieInfo?.voteAverage != nil ? "\(movieInfo?.voteAverage ?? 0)/5.0" : "N/A"
            posterImageView.setImageFrom(url: movieInfo?.posterPath ?? "")
            getImage(posterPath: movieInfo?.posterPath)
        }
    }

    var serieInfo: SearchTvModel? {
        didSet {
            titleLabel.text = serieInfo?.name
            releaseDateLabel.text = serieInfo?.firstAirDate
            voteAverageLabel.text = serieInfo?.voteAverage != nil ? "\(serieInfo?.voteAverage ?? 0)/5.0" : "N/A"
            getImage(posterPath: serieInfo?.posterPath)
        }
    }
    
    private func getImage(posterPath: String?) {
        if let posterPath = posterPath {
            let path: String = "\(NetworkConstants.imageBaseURL)\(posterPath)"
            posterImageView.setImageFrom(url: path)
        } else {
            posterImageView.image = UIImage(named: "pencil")
        }
    }
}
