//
// RuneObjSlotsInnerRunesInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RuneObjSlotsInnerRunesInner: Codable, JSONEncodable, Hashable {

    public var id: Double?
    public var key: String?
    public var icon: String?
    public var name: String?
    public var shortDesc: String?
    public var longDesc: String?

    public init(id: Double? = nil, key: String? = nil, icon: String? = nil, name: String? = nil, shortDesc: String? = nil, longDesc: String? = nil) {
        self.id = id
        self.key = key
        self.icon = icon
        self.name = name
        self.shortDesc = shortDesc
        self.longDesc = longDesc
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case key
        case icon
        case name
        case shortDesc
        case longDesc
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(icon, forKey: .icon)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(shortDesc, forKey: .shortDesc)
        try container.encodeIfPresent(longDesc, forKey: .longDesc)
    }
}

