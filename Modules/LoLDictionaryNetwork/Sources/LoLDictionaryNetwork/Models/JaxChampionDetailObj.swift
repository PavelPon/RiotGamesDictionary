//
// JaxChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct JaxChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var jax: ChampionDetailObj

    public init(jax: ChampionDetailObj) {
        self.jax = jax
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case jax = "Jax"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(jax, forKey: .jax)
    }
}
