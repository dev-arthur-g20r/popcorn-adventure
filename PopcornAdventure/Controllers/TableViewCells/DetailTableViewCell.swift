//
//  MovieDetailTableViewCell.swift
//  PopcornAdventure
//
//  Created by Arthur Tristan M. Ramos on 10/30/21.
//

import UIKit
import SDWebImage

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - Reusable functions for the cell
extension DetailTableViewCell {
    
    /// Display the details using the `Detail` struct. Use `SDWebImage` for displaying images and utilize its caching service along with its easier `placeholderImage` when image URL is not available.
    func displayDetails(of data: Detail?) {
        let imageURL = URL(string: data?.artworkUrl100 ?? "")
        artworkImageView.sd_setImage(with: imageURL, placeholderImage: Constants.shared.placeholderImage)
        titleLabel.text = data?.getTitle()
        genreLabel.text = data?.primaryGenreName ?? "No genres available."
        priceLabel.text = data?.getTrackPrice()
        self.accessoryType = .disclosureIndicator
    }
    
}
