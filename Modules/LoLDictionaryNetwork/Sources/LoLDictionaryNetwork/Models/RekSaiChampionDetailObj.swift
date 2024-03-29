//
// RekSaiChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RekSaiChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var rekSai: ChampionDetailObj

    public init(rekSai: ChampionDetailObj) {
        self.rekSai = rekSai
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case rekSai = "RekSai"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rekSai, forKey: .rekSai)
    }
}

