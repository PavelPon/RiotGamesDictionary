//
// NidaleeChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct NidaleeChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var nidalee: ChampionDetailObj

    public init(nidalee: ChampionDetailObj) {
        self.nidalee = nidalee
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case nidalee = "Nidalee"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nidalee, forKey: .nidalee)
    }
}

