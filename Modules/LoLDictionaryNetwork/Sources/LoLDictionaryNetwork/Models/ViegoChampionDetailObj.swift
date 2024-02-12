//
// ViegoChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ViegoChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var viego: ChampionDetailObj

    public init(viego: ChampionDetailObj) {
        self.viego = viego
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case viego = "Viego"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(viego, forKey: .viego)
    }
}

