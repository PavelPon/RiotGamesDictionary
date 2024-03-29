//
// ModelMatchInfoInfoParticipantsInnerMissions.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelMatchInfoInfoParticipantsInnerMissions: Codable, JSONEncodable, Hashable {

    public var playerScore0: Double
    public var playerScore1: Double
    public var playerScore10: Double
    public var playerScore11: Double
    public var playerScore2: Double
    public var playerScore3: Double
    public var playerScore4: Double
    public var playerScore5: Double
    public var playerScore6: Double
    public var playerScore7: Double
    public var playerScore8: Double
    public var playerScore9: Double

    public init(playerScore0: Double, playerScore1: Double, playerScore10: Double, playerScore11: Double, playerScore2: Double, playerScore3: Double, playerScore4: Double, playerScore5: Double, playerScore6: Double, playerScore7: Double, playerScore8: Double, playerScore9: Double) {
        self.playerScore0 = playerScore0
        self.playerScore1 = playerScore1
        self.playerScore10 = playerScore10
        self.playerScore11 = playerScore11
        self.playerScore2 = playerScore2
        self.playerScore3 = playerScore3
        self.playerScore4 = playerScore4
        self.playerScore5 = playerScore5
        self.playerScore6 = playerScore6
        self.playerScore7 = playerScore7
        self.playerScore8 = playerScore8
        self.playerScore9 = playerScore9
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case playerScore0
        case playerScore1
        case playerScore10
        case playerScore11
        case playerScore2
        case playerScore3
        case playerScore4
        case playerScore5
        case playerScore6
        case playerScore7
        case playerScore8
        case playerScore9
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(playerScore0, forKey: .playerScore0)
        try container.encode(playerScore1, forKey: .playerScore1)
        try container.encode(playerScore10, forKey: .playerScore10)
        try container.encode(playerScore11, forKey: .playerScore11)
        try container.encode(playerScore2, forKey: .playerScore2)
        try container.encode(playerScore3, forKey: .playerScore3)
        try container.encode(playerScore4, forKey: .playerScore4)
        try container.encode(playerScore5, forKey: .playerScore5)
        try container.encode(playerScore6, forKey: .playerScore6)
        try container.encode(playerScore7, forKey: .playerScore7)
        try container.encode(playerScore8, forKey: .playerScore8)
        try container.encode(playerScore9, forKey: .playerScore9)
    }
}

