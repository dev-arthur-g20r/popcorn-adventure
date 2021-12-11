//
//  Double+Extensions.swift
//  PopcornAdventure
//
//  Created by Arthur Tristan M. Ramos on 10/30/21.
//

import Foundation

extension Double {
    /// Format price to currency
    func getPrice() -> String {
        var price = "$0.00"
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        if let formattedPrice = formatter.string(from: self as NSNumber) {
            price = formattedPrice
        }
        return price
    }
}
