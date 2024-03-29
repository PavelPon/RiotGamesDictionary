//
// SonaChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SonaChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var sona: ChampionDetailObj

    public init(sona: ChampionDetailObj) {
        self.sona = sona
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case sona = "Sona"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sona, forKey: .sona)
    }
}

