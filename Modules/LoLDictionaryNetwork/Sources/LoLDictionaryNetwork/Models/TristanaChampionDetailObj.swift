//
// TristanaChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TristanaChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var tristana: ChampionDetailObj

    public init(tristana: ChampionDetailObj) {
        self.tristana = tristana
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case tristana = "Tristana"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tristana, forKey: .tristana)
    }
}
