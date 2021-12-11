//
//  String+Extensions.swift
//  PopcornAdventure
//
//  Created by Arthur Tristan M. Ramos on 10/31/21.
//

import Foundation
import StringExtensionHTML

extension String {
    /// Convert from HTML using StringExtensionHTML's `stringByStrippingHTMLTags` and `stringByDecodingHTMLEntities`. Replace `<br />` to `\n`.
    var convertedFromHTML: String {
        return self.stringByDecodingHTMLEntities.replacingOccurrences(of: "<br />", with: "\n").stringByStrippingHTMLTags
    }
    
    /// Capitalize string and change '-' to ' '.
    var cleanCategoryFormat: String {
        return self.capitalized.replacingOccurrences(of: "-", with: " ")
    }
}
