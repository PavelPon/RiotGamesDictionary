//
// VolibearChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VolibearChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var volibear: ChampionDetailObj

    public init(volibear: ChampionDetailObj) {
        self.volibear = volibear
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case volibear = "Volibear"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(volibear, forKey: .volibear)
    }
}

