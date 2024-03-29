//
// YasuoChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct YasuoChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var yasuo: ChampionDetailObj

    public init(yasuo: ChampionDetailObj) {
        self.yasuo = yasuo
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case yasuo = "Yasuo"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(yasuo, forKey: .yasuo)
    }
}

