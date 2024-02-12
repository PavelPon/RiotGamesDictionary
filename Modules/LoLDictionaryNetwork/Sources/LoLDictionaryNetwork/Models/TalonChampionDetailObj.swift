//
// TalonChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TalonChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var talon: ChampionDetailObj

    public init(talon: ChampionDetailObj) {
        self.talon = talon
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case talon = "Talon"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(talon, forKey: .talon)
    }
}

