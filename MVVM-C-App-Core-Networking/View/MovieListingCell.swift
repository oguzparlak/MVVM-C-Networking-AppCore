//
//  MovieListingCell.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListingCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var tvShowViewModel: TVShowCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func updateUI() {
        // Bind labels
        titleLabel.text = tvShowViewModel?.title
        overviewLabel.text = tvShowViewModel?.overview
        voteLabel.text = tvShowViewModel?.voteDescription
        // Bind Image
        let posterPath = tvShowViewModel?.backdropPath
        let imageUrl = TVShowEndPoint
            .image(width: String(500),
                   posterPath: posterPath ?? "")
            .provideUrl()
        posterImageView.kf.setImage(with: URL(string: imageUrl))
        posterImageView.kf.indicatorType = .activity
    }

}
