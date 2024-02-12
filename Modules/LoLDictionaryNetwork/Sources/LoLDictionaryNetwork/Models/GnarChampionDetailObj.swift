//
// GnarChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GnarChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var gnar: ChampionDetailObj

    public init(gnar: ChampionDetailObj) {
        self.gnar = gnar
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case gnar = "Gnar"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gnar, forKey: .gnar)
    }
}
