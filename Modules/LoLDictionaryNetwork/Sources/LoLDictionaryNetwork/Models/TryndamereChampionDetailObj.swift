//
// TryndamereChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TryndamereChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var tryndamere: ChampionDetailObj

    public init(tryndamere: ChampionDetailObj) {
        self.tryndamere = tryndamere
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tryndamere = "Tryndamere"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tryndamere, forKey: .tryndamere)
    }
}

