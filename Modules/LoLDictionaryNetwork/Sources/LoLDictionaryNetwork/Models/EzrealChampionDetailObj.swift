//
// EzrealChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EzrealChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var ezreal: ChampionDetailObj

    public init(ezreal: ChampionDetailObj) {
        self.ezreal = ezreal
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ezreal = "Ezreal"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ezreal, forKey: .ezreal)
    }
}
