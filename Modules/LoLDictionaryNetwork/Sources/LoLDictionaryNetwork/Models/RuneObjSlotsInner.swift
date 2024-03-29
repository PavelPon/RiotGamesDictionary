//
// RuneObjSlotsInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RuneObjSlotsInner: Codable, JSONEncodable, Hashable {

    public var runes: [RuneObjSlotsInnerRunesInner]?

    public init(runes: [RuneObjSlotsInnerRunesInner]? = nil) {
        self.runes = runes
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case runes
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(runes, forKey: .runes)
    }
}

