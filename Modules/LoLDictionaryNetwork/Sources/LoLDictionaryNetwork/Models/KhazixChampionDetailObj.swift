//
// KhazixChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct KhazixChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var khazix: ChampionDetailObj

    public init(khazix: ChampionDetailObj) {
        self.khazix = khazix
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case khazix = "Khazix"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(khazix, forKey: .khazix)
    }
}
