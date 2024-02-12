//
// NunuChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct NunuChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var nunu: ChampionDetailObj

    public init(nunu: ChampionDetailObj) {
        self.nunu = nunu
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case nunu = "Nunu"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nunu, forKey: .nunu)
    }
}
