//
// GravesChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GravesChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var graves: ChampionDetailObj

    public init(graves: ChampionDetailObj) {
        self.graves = graves
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case graves = "Graves"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graves, forKey: .graves)
    }
}

