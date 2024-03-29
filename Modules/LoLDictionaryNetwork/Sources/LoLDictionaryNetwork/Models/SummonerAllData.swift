//
// SummonerAllData.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SummonerAllData: Codable, JSONEncodable, Hashable {

    public var type: String
    public var version: String
    public var data: SummonerAllDataData

    public init(type: String, version: String, data: SummonerAllDataData) {
        self.type = type
        self.version = version
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case version
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(version, forKey: .version)
        try container.encode(data, forKey: .data)
    }
}

