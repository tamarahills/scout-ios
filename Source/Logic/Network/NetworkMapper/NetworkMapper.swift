//
//  NetworkMapper.swift
//  Scout
//
//

import Foundation
import SwiftyJSON

public enum JSONMappingResult {
    
    case successMapping(JSON)
    case failure(JSONMappingError)
}

public enum JSONCustomMappingResult {
    
    case success(Any)
    case failure
}

public enum JSONMappingError: Error {
    
    case invalidJSON
    case unknown
    
    var description: String {
        switch self {
        case .invalidJSON:            return "InvalidJSON"
        default:                      return "Unknown"
        }
    }
}

class NetworkMapper: NetworkMappingProtocol {
    
    func scoutTitles(fromResource resource: JSON) -> [ScoutArticle]? {
        var scoutArticlesArray = [ScoutArticle]()
    
        for (_ , value) in resource["articles"] {
            
            let item_id = value["item_id"].string ?? ""
            let author = value["author"].string ?? ""
            let title = value["title"].string ?? ""
            let lengthMinutes = value["lengthMinutes"].int ?? 0
            let resolved_url = value["resolved_url"].url ?? URL(string: "")
            let sort_id = value["sort_id"].int ?? 0
            let scoutArticle = ScoutArticle(withArticleID: item_id, title: title, author: author, lengthMinutes: lengthMinutes, sort_id: sort_id, resolved_url: resolved_url)
            scoutArticlesArray.append(scoutArticle)
        }
        return scoutArticlesArray
    }
    
}
