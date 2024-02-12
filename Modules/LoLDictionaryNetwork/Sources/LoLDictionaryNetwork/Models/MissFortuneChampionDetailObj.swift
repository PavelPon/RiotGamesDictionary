//
// MissFortuneChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MissFortuneChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var missFortune: ChampionDetailObj

    public init(missFortune: ChampionDetailObj) {
        self.missFortune = missFortune
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case missFortune = "MissFortune"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(missFortune, forKey: .missFortune)
    }
}
