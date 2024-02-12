//
// VeigarChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VeigarChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var veigar: ChampionDetailObj

    public init(veigar: ChampionDetailObj) {
        self.veigar = veigar
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case veigar = "Veigar"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(veigar, forKey: .veigar)
    }
}

