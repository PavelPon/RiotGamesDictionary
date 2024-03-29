//
// ApheliosChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ApheliosChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var aphelios: ChampionDetailObj

    public init(aphelios: ChampionDetailObj) {
        self.aphelios = aphelios
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case aphelios = "Aphelios"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(aphelios, forKey: .aphelios)
    }
}

