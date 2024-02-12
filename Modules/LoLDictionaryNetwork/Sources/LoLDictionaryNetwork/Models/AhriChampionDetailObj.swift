//
// AhriChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AhriChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var ahri: ChampionDetailObj

    public init(ahri: ChampionDetailObj) {
        self.ahri = ahri
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ahri = "Ahri"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ahri, forKey: .ahri)
    }
}

