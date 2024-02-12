//
// ModelMatchInfoInfoTeamsInnerObjectives.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelMatchInfoInfoTeamsInnerObjectives: Codable, JSONEncodable, Hashable {

    public var baron: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var champion: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var dragon: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var horde: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var inhibitor: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var riftHerald: ModelMatchInfoInfoTeamsInnerObjectivesBaron
    public var tower: ModelMatchInfoInfoTeamsInnerObjectivesBaron

    public init(baron: ModelMatchInfoInfoTeamsInnerObjectivesBaron, champion: ModelMatchInfoInfoTeamsInnerObjectivesBaron, dragon: ModelMatchInfoInfoTeamsInnerObjectivesBaron, horde: ModelMatchInfoInfoTeamsInnerObjectivesBaron, inhibitor: ModelMatchInfoInfoTeamsInnerObjectivesBaron, riftHerald: ModelMatchInfoInfoTeamsInnerObjectivesBaron, tower: ModelMatchInfoInfoTeamsInnerObjectivesBaron) {
        self.baron = baron
        self.champion = champion
        self.dragon = dragon
        self.horde = horde
        self.inhibitor = inhibitor
        self.riftHerald = riftHerald
        self.tower = tower
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case baron
        case champion
        case dragon
        case horde
        case inhibitor
        case riftHerald
        case tower
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(baron, forKey: .baron)
        try container.encode(champion, forKey: .champion)
        try container.encode(dragon, forKey: .dragon)
        try container.encode(horde, forKey: .horde)
        try container.encode(inhibitor, forKey: .inhibitor)
        try container.encode(riftHerald, forKey: .riftHerald)
        try container.encode(tower, forKey: .tower)
    }
}
