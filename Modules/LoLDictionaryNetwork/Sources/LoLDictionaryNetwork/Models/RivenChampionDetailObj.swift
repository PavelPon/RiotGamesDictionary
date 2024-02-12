//
// RivenChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RivenChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var riven: ChampionDetailObj

    public init(riven: ChampionDetailObj) {
        self.riven = riven
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case riven = "Riven"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(riven, forKey: .riven)
    }
}
