//
// MilioChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MilioChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var milio: ChampionDetailObj

    public init(milio: ChampionDetailObj) {
        self.milio = milio
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case milio = "Milio"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(milio, forKey: .milio)
    }
}

