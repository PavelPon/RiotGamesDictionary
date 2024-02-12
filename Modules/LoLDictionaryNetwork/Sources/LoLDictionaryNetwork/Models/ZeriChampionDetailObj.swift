//
// ZeriChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ZeriChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var zeri: ChampionDetailObj

    public init(zeri: ChampionDetailObj) {
        self.zeri = zeri
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case zeri = "Zeri"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(zeri, forKey: .zeri)
    }
}
