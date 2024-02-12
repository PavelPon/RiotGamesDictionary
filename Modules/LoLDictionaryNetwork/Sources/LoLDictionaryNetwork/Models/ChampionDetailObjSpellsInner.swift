//
// ChampionDetailObjSpellsInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ChampionDetailObjSpellsInner: Codable, JSONEncodable, Hashable {

    public var id: String?
    public var name: String?
    public var description: String?
    public var tooltip: String?
    public var leveltip: LevelTipObj?
    public var maxrank: Double?
    public var cooldown: [Double]?
    public var cooldownBurn: String?
    public var cost: [Double]?
    public var costBurn: String?
    public var costType: String?
    public var maxammo: String?
    public var range: [Double]?
    public var rangeBurn: String?
    public var image: ImageObj?
    public var resource: String?

    public init(id: String? = nil, name: String? = nil, description: String? = nil, tooltip: String? = nil, leveltip: LevelTipObj? = nil, maxrank: Double? = nil, cooldown: [Double]? = nil, cooldownBurn: String? = nil, cost: [Double]? = nil, costBurn: String? = nil, costType: String? = nil, maxammo: String? = nil, range: [Double]? = nil, rangeBurn: String? = nil, image: ImageObj? = nil, resource: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.tooltip = tooltip
        self.leveltip = leveltip
        self.maxrank = maxrank
        self.cooldown = cooldown
        self.cooldownBurn = cooldownBurn
        self.cost = cost
        self.costBurn = costBurn
        self.costType = costType
        self.maxammo = maxammo
        self.range = range
        self.rangeBurn = rangeBurn
        self.image = image
        self.resource = resource
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case tooltip
        case leveltip
        case maxrank
        case cooldown
        case cooldownBurn
        case cost
        case costBurn
        case costType
        case maxammo
        case range
        case rangeBurn
        case image
        case resource
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(tooltip, forKey: .tooltip)
        try container.encodeIfPresent(leveltip, forKey: .leveltip)
        try container.encodeIfPresent(maxrank, forKey: .maxrank)
        try container.encodeIfPresent(cooldown, forKey: .cooldown)
        try container.encodeIfPresent(cooldownBurn, forKey: .cooldownBurn)
        try container.encodeIfPresent(cost, forKey: .cost)
        try container.encodeIfPresent(costBurn, forKey: .costBurn)
        try container.encodeIfPresent(costType, forKey: .costType)
        try container.encodeIfPresent(maxammo, forKey: .maxammo)
        try container.encodeIfPresent(range, forKey: .range)
        try container.encodeIfPresent(rangeBurn, forKey: .rangeBurn)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(resource, forKey: .resource)
    }
}

