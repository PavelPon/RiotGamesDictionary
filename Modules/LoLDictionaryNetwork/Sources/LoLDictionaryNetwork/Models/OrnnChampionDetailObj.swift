//
// OrnnChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct OrnnChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var ornn: ChampionDetailObj

    public init(ornn: ChampionDetailObj) {
        self.ornn = ornn
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ornn = "Ornn"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ornn, forKey: .ornn)
    }
}

