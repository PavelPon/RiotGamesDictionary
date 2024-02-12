//
// ModelMatchInfoInfoTeamsInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelMatchInfoInfoTeamsInner: Codable, JSONEncodable, Hashable {

    public var objectives: ModelMatchInfoInfoTeamsInnerObjectives?
    public var teamId: Double?
    public var win: Bool?

    public init(objectives: ModelMatchInfoInfoTeamsInnerObjectives? = nil, teamId: Double? = nil, win: Bool? = nil) {
        self.objectives = objectives
        self.teamId = teamId
        self.win = win
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case objectives
        case teamId
        case win
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(objectives, forKey: .objectives)
        try container.encodeIfPresent(teamId, forKey: .teamId)
        try container.encodeIfPresent(win, forKey: .win)
    }
}

