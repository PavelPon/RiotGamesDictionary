//
// SettChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SettChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var sett: ChampionDetailObj

    public init(sett: ChampionDetailObj) {
        self.sett = sett
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case sett = "Sett"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sett, forKey: .sett)
    }
}

