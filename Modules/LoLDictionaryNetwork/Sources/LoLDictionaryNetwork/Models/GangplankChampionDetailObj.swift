//
// GangplankChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GangplankChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var gangplank: ChampionDetailObj

    public init(gangplank: ChampionDetailObj) {
        self.gangplank = gangplank
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case gangplank = "Gangplank"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gangplank, forKey: .gangplank)
    }
}

