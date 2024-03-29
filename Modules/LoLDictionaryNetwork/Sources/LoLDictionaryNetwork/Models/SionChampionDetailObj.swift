//
// SionChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SionChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var sion: ChampionDetailObj

    public init(sion: ChampionDetailObj) {
        self.sion = sion
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case sion = "Sion"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sion, forKey: .sion)
    }
}

