//
// ViktorChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ViktorChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var viktor: ChampionDetailObj

    public init(viktor: ChampionDetailObj) {
        self.viktor = viktor
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case viktor = "Viktor"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(viktor, forKey: .viktor)
    }
}

