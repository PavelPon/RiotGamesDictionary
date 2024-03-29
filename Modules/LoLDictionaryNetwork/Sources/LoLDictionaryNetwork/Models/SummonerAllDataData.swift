//
// SummonerAllDataData.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SummonerAllDataData: Codable, JSONEncodable, Hashable {

    public var summonerBarrier: SummonerObj
    public var summonerBoost: SummonerObj
    public var summonerCherryFlash: SummonerObj
    public var summonerCherryHold: SummonerObj
    public var summonerDot: SummonerObj
    public var summonerExhaust: SummonerObj
    public var summonerFlash: SummonerObj
    public var summonerHaste: SummonerObj
    public var summonerHeal: SummonerObj
    public var summonerMana: SummonerObj
    public var summonerPoroRecall: SummonerObj
    public var summonerPoroThrow: SummonerObj
    public var summonerSmite: SummonerObj
    public var summonerSnowURFSnowballMark: SummonerObj
    public var summonerSnowball: SummonerObj
    public var summonerTeleport: SummonerObj
    public var summonerUltBookPlaceholder: SummonerObj
    public var summonerUltBookSmitePlaceholder: SummonerObj

    public init(summonerBarrier: SummonerObj, summonerBoost: SummonerObj, summonerCherryFlash: SummonerObj, summonerCherryHold: SummonerObj, summonerDot: SummonerObj, summonerExhaust: SummonerObj, summonerFlash: SummonerObj, summonerHaste: SummonerObj, summonerHeal: SummonerObj, summonerMana: SummonerObj, summonerPoroRecall: SummonerObj, summonerPoroThrow: SummonerObj, summonerSmite: SummonerObj, summonerSnowURFSnowballMark: SummonerObj, summonerSnowball: SummonerObj, summonerTeleport: SummonerObj, summonerUltBookPlaceholder: SummonerObj, summonerUltBookSmitePlaceholder: SummonerObj) {
        self.summonerBarrier = summonerBarrier
        self.summonerBoost = summonerBoost
        self.summonerCherryFlash = summonerCherryFlash
        self.summonerCherryHold = summonerCherryHold
        self.summonerDot = summonerDot
        self.summonerExhaust = summonerExhaust
        self.summonerFlash = summonerFlash
        self.summonerHaste = summonerHaste
        self.summonerHeal = summonerHeal
        self.summonerMana = summonerMana
        self.summonerPoroRecall = summonerPoroRecall
        self.summonerPoroThrow = summonerPoroThrow
        self.summonerSmite = summonerSmite
        self.summonerSnowURFSnowballMark = summonerSnowURFSnowballMark
        self.summonerSnowball = summonerSnowball
        self.summonerTeleport = summonerTeleport
        self.summonerUltBookPlaceholder = summonerUltBookPlaceholder
        self.summonerUltBookSmitePlaceholder = summonerUltBookSmitePlaceholder
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case summonerBarrier = "SummonerBarrier"
        case summonerBoost = "SummonerBoost"
        case summonerCherryFlash = "SummonerCherryFlash"
        case summonerCherryHold = "SummonerCherryHold"
        case summonerDot = "SummonerDot"
        case summonerExhaust = "SummonerExhaust"
        case summonerFlash = "SummonerFlash"
        case summonerHaste = "SummonerHaste"
        case summonerHeal = "SummonerHeal"
        case summonerMana = "SummonerMana"
        case summonerPoroRecall = "SummonerPoroRecall"
        case summonerPoroThrow = "SummonerPoroThrow"
        case summonerSmite = "SummonerSmite"
        case summonerSnowURFSnowballMark = "SummonerSnowURFSnowball_Mark"
        case summonerSnowball = "SummonerSnowball"
        case summonerTeleport = "SummonerTeleport"
        case summonerUltBookPlaceholder = "Summoner_UltBookPlaceholder"
        case summonerUltBookSmitePlaceholder = "Summoner_UltBookSmitePlaceholder"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(summonerBarrier, forKey: .summonerBarrier)
        try container.encode(summonerBoost, forKey: .summonerBoost)
        try container.encode(summonerCherryFlash, forKey: .summonerCherryFlash)
        try container.encode(summonerCherryHold, forKey: .summonerCherryHold)
        try container.encode(summonerDot, forKey: .summonerDot)
        try container.encode(summonerExhaust, forKey: .summonerExhaust)
        try container.encode(summonerFlash, forKey: .summonerFlash)
        try container.encode(summonerHaste, forKey: .summonerHaste)
        try container.encode(summonerHeal, forKey: .summonerHeal)
        try container.encode(summonerMana, forKey: .summonerMana)
        try container.encode(summonerPoroRecall, forKey: .summonerPoroRecall)
        try container.encode(summonerPoroThrow, forKey: .summonerPoroThrow)
        try container.encode(summonerSmite, forKey: .summonerSmite)
        try container.encode(summonerSnowURFSnowballMark, forKey: .summonerSnowURFSnowballMark)
        try container.encode(summonerSnowball, forKey: .summonerSnowball)
        try container.encode(summonerTeleport, forKey: .summonerTeleport)
        try container.encode(summonerUltBookPlaceholder, forKey: .summonerUltBookPlaceholder)
        try container.encode(summonerUltBookSmitePlaceholder, forKey: .summonerUltBookSmitePlaceholder)
    }
}

