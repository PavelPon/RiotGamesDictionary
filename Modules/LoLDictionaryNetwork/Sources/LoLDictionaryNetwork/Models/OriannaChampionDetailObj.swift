//
// OriannaChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct OriannaChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var orianna: ChampionDetailObj

    public init(orianna: ChampionDetailObj) {
        self.orianna = orianna
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case orianna = "Orianna"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orianna, forKey: .orianna)
    }
}

