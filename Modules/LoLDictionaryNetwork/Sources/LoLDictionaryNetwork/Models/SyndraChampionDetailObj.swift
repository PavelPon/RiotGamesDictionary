//
// SyndraChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SyndraChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var syndra: ChampionDetailObj

    public init(syndra: ChampionDetailObj) {
        self.syndra = syndra
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case syndra = "Syndra"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(syndra, forKey: .syndra)
    }
}
