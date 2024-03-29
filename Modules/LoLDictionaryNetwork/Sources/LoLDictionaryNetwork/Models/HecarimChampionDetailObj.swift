//
// HecarimChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct HecarimChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var hecarim: ChampionDetailObj

    public init(hecarim: ChampionDetailObj) {
        self.hecarim = hecarim
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case hecarim = "Hecarim"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hecarim, forKey: .hecarim)
    }
}

