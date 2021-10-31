//
//  Constants.swift
//  PopcornAdventure
//
//  Created by EasyPOS iOS Dev on 10/30/21.
//

import UIKit

class Constants {
    static let shared = Constants()
    
    let baseURL = "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all"
    let tableViewHeight = 170
    let persistenceService = UserDefaults.standard
    let placeholderImage = UIImage(named: "brand-icon")
}

class Utilities {
    /// Set the date user last used the application to be used during exit of the app.
    func setDateLastSeen() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMMM dd, yyyy h:mm a"
        let dateLastSeen = dateFormatter.string(from: Date())
        let persistenceService = Constants.shared.persistenceService
        persistenceService.set(dateLastSeen, forKey: "dateLastSeen")
    }
}
