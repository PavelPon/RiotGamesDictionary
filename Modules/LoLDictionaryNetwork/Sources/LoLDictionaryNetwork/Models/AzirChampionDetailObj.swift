//
// AzirChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AzirChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var azir: ChampionDetailObj

    public init(azir: ChampionDetailObj) {
        self.azir = azir
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case azir = "Azir"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(azir, forKey: .azir)
    }
}

