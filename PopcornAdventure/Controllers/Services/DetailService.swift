//
//  MovieDetailService.swift
//  PopcornAdventure
//
//  Created by EasyPOS iOS Dev on 10/30/21.
//

import Foundation
import Alamofire

class DetailService {
    /// Get details from API, decode to the `DetailResponse` struct. Return a callback if successful, `DetailResponse` struct containing the results. Otherwise an `Error`. Used Alamofire since it has built in classes for responses containing `result` wherein you'll just check if either `success` or `failure`.
    func getDetails(completion: @escaping (DetailResponse?,Error?)->()) {
        let url = Constants.shared.baseURL
        
        if let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) {
            AF.request(encodedURL).response { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        guard
                            let jsonString = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                            let info = try? JSONSerialization.data(withJSONObject: jsonString, options: .prettyPrinted),
                            let results = try? JSONDecoder().decode(DetailResponse.self, from: info)
                        else { return }
                        completion(results,nil)
                    }
                case .failure(let error):
                    completion(nil,error)
                }
            }
        }
    }
}
