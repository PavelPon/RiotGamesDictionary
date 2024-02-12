//
// SwainChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SwainChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var swain: ChampionDetailObj

    public init(swain: ChampionDetailObj) {
        self.swain = swain
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case swain = "Swain"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(swain, forKey: .swain)
    }
}
