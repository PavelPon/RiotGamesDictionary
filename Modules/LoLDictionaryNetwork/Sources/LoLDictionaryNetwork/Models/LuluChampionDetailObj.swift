//
// LuluChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LuluChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var lulu: ChampionDetailObj

    public init(lulu: ChampionDetailObj) {
        self.lulu = lulu
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case lulu = "Lulu"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lulu, forKey: .lulu)
    }
}

