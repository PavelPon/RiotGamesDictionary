//
// SingedChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SingedChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var singed: ChampionDetailObj

    public init(singed: ChampionDetailObj) {
        self.singed = singed
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case singed = "Singed"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(singed, forKey: .singed)
    }
}

