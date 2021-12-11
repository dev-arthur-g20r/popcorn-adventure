//
//  Constants.swift
//  PopcornAdventure
//
//  Created by Arthur Tristan M. Ramosv on 10/30/21.
//

import UIKit

// MARK: - Class containing constants available globally for reusability especially if these constants are frequently used
class Constants {
    
    static let shared = Constants()
    
    let baseURL = "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all"
    let tableViewHeight = 170
    let persistenceService = UserDefaults.standard
    let placeholderImage = UIImage(named: "brand-icon")
    
}

// MARK: - Class containing reusable functions available globally
class Utilities {
    
    /// Set the date user last used the application to be used during exit of the app. We use `UserDefaults` to store data when user closes the app for the application to get again when user comes back to the app.
    func setDateLastSeen() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMMM dd, yyyy h:mm a"
        let dateLastSeen = dateFormatter.string(from: Date())
        let persistenceService = Constants.shared.persistenceService
        persistenceService.set(dateLastSeen, forKey: "dateLastSeen")
    }
    
}
