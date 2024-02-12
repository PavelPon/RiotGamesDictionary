//
// LuxChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LuxChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var lux: ChampionDetailObj

    public init(lux: ChampionDetailObj) {
        self.lux = lux
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case lux = "Lux"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lux, forKey: .lux)
    }
}

