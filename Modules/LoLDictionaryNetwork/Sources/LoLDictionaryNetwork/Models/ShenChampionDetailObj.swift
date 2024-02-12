//
// ShenChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ShenChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var shen: ChampionDetailObj

    public init(shen: ChampionDetailObj) {
        self.shen = shen
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case shen = "Shen"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(shen, forKey: .shen)
    }
}
