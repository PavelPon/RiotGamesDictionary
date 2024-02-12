//
// BrandChampionDetailObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BrandChampionDetailObj: Codable, JSONEncodable, Hashable {

    public var brand: ChampionDetailObj

    public init(brand: ChampionDetailObj) {
        self.brand = brand
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case brand = "Brand"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
    }
}

