//
// AatroxChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AatroxChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var aatrox: ChampionDetailObj

    public init(aatrox: ChampionDetailObj) {
        self.aatrox = aatrox
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case aatrox = "Aatrox"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(aatrox, forKey: .aatrox)
    }
}

