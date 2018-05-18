//
//  NetworkMappingProtocol.swift
//  Scout
//
//

import Foundation
import SwiftyJSON

protocol NetworkMappingProtocol {
    func scoutTitles(fromResource resource: JSON) -> [ScoutArticle]?
}
