//
//  DetailViewController.swift
//  PopcornAdventure
//
//  Created by EasyPOS iOS Dev on 10/30/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bigPosterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    
    @IBOutlet weak var posterWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var posterHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    var detail: Detail?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        setupNavigationBar()
        displayData()
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Configure views
extension DetailViewController {
    /// Set up navigation title displaying kind or wrapper type. Make the tint color of left bar button white when in Dark mode. Otherwise, black.
    private func setupNavigationBar() {
        title = detail?.getNavigationTitle() ?? ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    /// Display available data based on the detail selected from the list
    private func displayData() {
        let imageURL = URL(string: detail?.artworkUrl100 ?? "")
        let isSongOrAudiobook = detail?.isSongOrAudiobook ?? false
        bigPosterImageView.sd_setImage(with: imageURL, placeholderImage: Constants.shared.placeholderImage)
        posterHeightConstraint.constant = isSongOrAudiobook ? 200 : 300
        posterWidthConstraint.constant = isSongOrAudiobook ? 200 : 250
        titleLabel.text = detail?.getTitle() ?? ""
        artistLabel.text = detail?.artistName ?? "Anonymous"
        priceLabel.text = detail?.getTrackPrice() ?? ""
        genreLabel.text = detail?.primaryGenreName ?? "No genres available."
        longDescriptionLabel.text = detail?.getDescription() ?? "No description available."
        scrollViewHeightConstraint.constant += (detail?.getDescription().count ?? 0).toCGFloat()
        scrollViewHeightConstraint.constant /= 2
    }
}

// MARK: - Objc functions
extension DetailViewController {
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
