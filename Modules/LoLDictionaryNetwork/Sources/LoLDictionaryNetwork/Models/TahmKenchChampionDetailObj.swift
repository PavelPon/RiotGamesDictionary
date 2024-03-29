//
// TahmKenchChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TahmKenchChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var tahmKench: ChampionDetailObj

    public init(tahmKench: ChampionDetailObj) {
        self.tahmKench = tahmKench
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tahmKench = "TahmKench"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tahmKench, forKey: .tahmKench)
    }
}

