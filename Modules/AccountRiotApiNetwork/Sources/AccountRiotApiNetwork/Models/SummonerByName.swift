//
// SummonerByName.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SummonerByName: Codable, JSONEncodable, Hashable {

    public var id: String
    public var accountId: String
    public var puuid: String
    public var name: String
    public var profileIconId: Double
    public var revisionDate: Double
    public var summonerLevel: Double

    public init(id: String, accountId: String, puuid: String, name: String, profileIconId: Double, revisionDate: Double, summonerLevel: Double) {
        self.id = id
        self.accountId = accountId
        self.puuid = puuid
        self.name = name
        self.profileIconId = profileIconId
        self.revisionDate = revisionDate
        self.summonerLevel = summonerLevel
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case accountId
        case puuid
        case name
        case profileIconId
        case revisionDate
        case summonerLevel
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(puuid, forKey: .puuid)
        try container.encode(name, forKey: .name)
        try container.encode(profileIconId, forKey: .profileIconId)
        try container.encode(revisionDate, forKey: .revisionDate)
        try container.encode(summonerLevel, forKey: .summonerLevel)
    }
}
