//
// KatarinaChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct KatarinaChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var katarina: ChampionDetailObj

    public init(katarina: ChampionDetailObj) {
        self.katarina = katarina
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case katarina = "Katarina"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(katarina, forKey: .katarina)
    }
}

