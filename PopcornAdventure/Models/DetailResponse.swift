//
//  DetailResponse.swift
//  PopcornAdventure
//
//  Created by EasyPOS iOS Dev on 10/30/21.
//

import Foundation

/// This struct represents the JSON returned by the API.
struct DetailResponse: Codable {
    let resultCount: Int?
    let results: [Detail]?
}

/// This struct represents the object in the `results` array.
struct Detail: Codable {
    let wrapperType: String?
    let kind: String?
    let trackName: String?
    let collectionName: String?
    let artistName: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let primaryGenreName: String?
    let trackPrice: Double?
    let collectionPrice: Double?
    let description: String?
    let longDescription: String?
    
    /// Return if item is song or audiobook.
    var isSongOrAudiobook: Bool {
        return kind ?? "" == "audiobook" || kind ?? "" == "song"
    }
    
    /// Return the formatted track price when available otherwise the formatted collection price.
    func getTrackPrice() -> String {
        return trackPrice == nil ? collectionPrice?.getPrice() ?? "$0.00" : trackPrice?.getPrice() ?? "$0.00"
    }
    
    /// Return the track name when available otherwise the collection name.
    func getTitle() -> String {
        return trackName == nil ? collectionName ?? "" : trackName ?? ""
    }
    
    /// Return the `longDescription` when available otherwise  `description`. Decode and strip HTML entities then change `<br />` to `\n`.
    func getDescription() -> String {
        let description = longDescription == nil ? description ?? "No description available." : longDescription ?? "No description available."
        return description.convertedFromHTML
    }
    
    /// Return kind  if available otherwise wrapper type to display in the detail view.
    func getNavigationTitle() -> String {
        return kind == nil ? wrapperType?.cleanCategoryFormat ?? "" : kind?.cleanCategoryFormat ?? ""
    }
}
