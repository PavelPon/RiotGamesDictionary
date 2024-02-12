//
// HeimerdingerChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct HeimerdingerChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var heimerdinger: ChampionDetailObj

    public init(heimerdinger: ChampionDetailObj) {
        self.heimerdinger = heimerdinger
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case heimerdinger = "Heimerdinger"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(heimerdinger, forKey: .heimerdinger)
    }
}

