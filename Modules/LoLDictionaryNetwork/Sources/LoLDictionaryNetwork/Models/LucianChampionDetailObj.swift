//
// LucianChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LucianChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var lucian: ChampionDetailObj

    public init(lucian: ChampionDetailObj) {
        self.lucian = lucian
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case lucian = "Lucian"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lucian, forKey: .lucian)
    }
}
