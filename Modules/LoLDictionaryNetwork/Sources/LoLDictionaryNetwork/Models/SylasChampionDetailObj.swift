//
// SylasChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SylasChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var sylas: ChampionDetailObj

    public init(sylas: ChampionDetailObj) {
        self.sylas = sylas
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case sylas = "Sylas"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sylas, forKey: .sylas)
    }
}

