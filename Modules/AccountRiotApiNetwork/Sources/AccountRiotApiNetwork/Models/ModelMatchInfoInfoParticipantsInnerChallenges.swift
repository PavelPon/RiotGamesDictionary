//
// ModelMatchInfoInfoParticipantsInnerChallenges.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelMatchInfoInfoParticipantsInnerChallenges: Codable, JSONEncodable, Hashable {

    public var _12assistStreakCount: Double
    public var abilityUses: Double
    public var acesBefore15Minutes: Double
    public var alliedJungleMonsterKills: Double
    public var baronTakedowns: Double
    public var blastConeOppositeOpponentCount: Double
    public var bountyGold: Double
    public var buffsStolen: Double
    public var completeSupportQuestInTime: Double
    public var controlWardsPlaced: Double
    public var damagePerMinute: Double
    public var damageTakenOnTeamPercentage: Double
    public var dancedWithRiftHerald: Double
    public var deathsByEnemyChamps: Double
    public var dodgeSkillShotsSmallWindow: Double
    public var doubleAces: Double
    public var dragonTakedowns: Double
    public var earliestDragonTakedown: Double
    public var earlyLaningPhaseGoldExpAdvantage: Double
    public var effectiveHealAndShielding: Double
    public var elderDragonKillsWithOpposingSoul: Double
    public var elderDragonMultikills: Double
    public var enemyChampionImmobilizations: Double
    public var enemyJungleMonsterKills: Double
    public var epicMonsterKillsNearEnemyJungler: Double
    public var epicMonsterKillsWithin30SecondsOfSpawn: Double
    public var epicMonsterSteals: Double
    public var epicMonsterStolenWithoutSmite: Double
    public var fastestLegendary: Double
    public var firstTurretKilled: Double
    public var firstTurretKilledTime: Double
    public var flawlessAces: Double
    public var fullTeamTakedown: Double
    public var gameLength: Double
    public var getTakedownsInAllLanesEarlyJungleAsLaner: Double
    public var goldPerMinute: Double
    public var hadOpenNexus: Double
    public var immobilizeAndKillWithAlly: Double
    public var initialBuffCount: Double
    public var initialCrabCount: Double
    public var jungleCsBefore10Minutes: Double
    public var junglerTakedownsNearDamagedEpicMonster: Double
    public var kTurretsDestroyedBeforePlatesFall: Double
    public var kda: Double
    public var killAfterHiddenWithAlly: Double
    public var killParticipation: Double
    public var killedChampTookFullTeamDamageSurvived: Double
    public var killingSprees: Double
    public var killsNearEnemyTurret: Double
    public var killsOnOtherLanesEarlyJungleAsLaner: Double
    public var killsOnRecentlyHealedByAramPack: Double
    public var killsUnderOwnTurret: Double
    public var killsWithHelpFromEpicMonster: Double
    public var knockEnemyIntoTeamAndKill: Double
    public var landSkillShotsEarlyGame: Double
    public var laneMinionsFirst10Minutes: Double
    public var laningPhaseGoldExpAdvantage: Double
    public var legendaryCount: Double
    public var legendaryItemUsed: [Double]
    public var lostAnInhibitor: Double
    public var maxCsAdvantageOnLaneOpponent: Double
    public var maxKillDeficit: Double
    public var maxLevelLeadLaneOpponent: Double
    public var mejaisFullStackInTime: Double
    public var moreEnemyJungleThanOpponent: Double
    public var multiKillOneSpell: Double
    public var multiTurretRiftHeraldCount: Double
    public var multikills: Double
    public var multikillsAfterAggressiveFlash: Double
    public var outerTurretExecutesBefore10Minutes: Double
    public var outnumberedKills: Double
    public var outnumberedNexusKill: Double
    public var perfectDragonSoulsTaken: Double
    public var perfectGame: Double
    public var pickKillWithAlly: Double
    public var poroExplosions: Double
    public var quickCleanse: Double
    public var quickFirstTurret: Double
    public var quickSoloKills: Double
    public var riftHeraldTakedowns: Double
    public var saveAllyFromDeath: Double
    public var scuttleCrabKills: Double
    public var skillshotsDodged: Double
    public var skillshotsHit: Double
    public var snowballsHit: Double
    public var soloBaronKills: Double
    public var soloKills: Double
    public var stealthWardsPlaced: Double
    public var survivedSingleDigitHpCount: Double
    public var survivedThreeImmobilizesInFight: Double
    public var takedownOnFirstTurret: Double
    public var takedowns: Double
    public var takedownsAfterGainingLevelAdvantage: Double
    public var takedownsBeforeJungleMinionSpawn: Double
    public var takedownsFirstXMinutes: Double
    public var takedownsInAlcove: Double
    public var takedownsInEnemyFountain: Double
    public var teamBaronKills: Double
    public var teamDamagePercentage: Double
    public var teamElderDragonKills: Double
    public var teamRiftHeraldKills: Double
    public var thirdInhibitorDestroyedTime: Double
    public var tookLargeDamageSurvived: Double
    public var turretPlatesTaken: Double
    public var turretTakedowns: Double
    public var turretsTakenWithRiftHerald: Double
    public var twentyMinionsIn3SecondsCount: Double
    public var twoWardsOneSweeperCount: Double
    public var unseenRecalls: Double
    public var visionScoreAdvantageLaneOpponent: Double
    public var visionScorePerMinute: Double
    public var wardTakedowns: Double
    public var wardTakedownsBefore20M: Double
    public var wardsGuarded: Double

    public init(_12assistStreakCount: Double, abilityUses: Double, acesBefore15Minutes: Double, alliedJungleMonsterKills: Double, baronTakedowns: Double, blastConeOppositeOpponentCount: Double, bountyGold: Double, buffsStolen: Double, completeSupportQuestInTime: Double, controlWardsPlaced: Double, damagePerMinute: Double, damageTakenOnTeamPercentage: Double, dancedWithRiftHerald: Double, deathsByEnemyChamps: Double, dodgeSkillShotsSmallWindow: Double, doubleAces: Double, dragonTakedowns: Double, earliestDragonTakedown: Double, earlyLaningPhaseGoldExpAdvantage: Double, effectiveHealAndShielding: Double, elderDragonKillsWithOpposingSoul: Double, elderDragonMultikills: Double, enemyChampionImmobilizations: Double, enemyJungleMonsterKills: Double, epicMonsterKillsNearEnemyJungler: Double, epicMonsterKillsWithin30SecondsOfSpawn: Double, epicMonsterSteals: Double, epicMonsterStolenWithoutSmite: Double, fastestLegendary: Double, firstTurretKilled: Double, firstTurretKilledTime: Double, flawlessAces: Double, fullTeamTakedown: Double, gameLength: Double, getTakedownsInAllLanesEarlyJungleAsLaner: Double, goldPerMinute: Double, hadOpenNexus: Double, immobilizeAndKillWithAlly: Double, initialBuffCount: Double, initialCrabCount: Double, jungleCsBefore10Minutes: Double, junglerTakedownsNearDamagedEpicMonster: Double, kTurretsDestroyedBeforePlatesFall: Double, kda: Double, killAfterHiddenWithAlly: Double, killParticipation: Double, killedChampTookFullTeamDamageSurvived: Double, killingSprees: Double, killsNearEnemyTurret: Double, killsOnOtherLanesEarlyJungleAsLaner: Double, killsOnRecentlyHealedByAramPack: Double, killsUnderOwnTurret: Double, killsWithHelpFromEpicMonster: Double, knockEnemyIntoTeamAndKill: Double, landSkillShotsEarlyGame: Double, laneMinionsFirst10Minutes: Double, laningPhaseGoldExpAdvantage: Double, legendaryCount: Double, legendaryItemUsed: [Double], lostAnInhibitor: Double, maxCsAdvantageOnLaneOpponent: Double, maxKillDeficit: Double, maxLevelLeadLaneOpponent: Double, mejaisFullStackInTime: Double, moreEnemyJungleThanOpponent: Double, multiKillOneSpell: Double, multiTurretRiftHeraldCount: Double, multikills: Double, multikillsAfterAggressiveFlash: Double, outerTurretExecutesBefore10Minutes: Double, outnumberedKills: Double, outnumberedNexusKill: Double, perfectDragonSoulsTaken: Double, perfectGame: Double, pickKillWithAlly: Double, poroExplosions: Double, quickCleanse: Double, quickFirstTurret: Double, quickSoloKills: Double, riftHeraldTakedowns: Double, saveAllyFromDeath: Double, scuttleCrabKills: Double, skillshotsDodged: Double, skillshotsHit: Double, snowballsHit: Double, soloBaronKills: Double, soloKills: Double, stealthWardsPlaced: Double, survivedSingleDigitHpCount: Double, survivedThreeImmobilizesInFight: Double, takedownOnFirstTurret: Double, takedowns: Double, takedownsAfterGainingLevelAdvantage: Double, takedownsBeforeJungleMinionSpawn: Double, takedownsFirstXMinutes: Double, takedownsInAlcove: Double, takedownsInEnemyFountain: Double, teamBaronKills: Double, teamDamagePercentage: Double, teamElderDragonKills: Double, teamRiftHeraldKills: Double, thirdInhibitorDestroyedTime: Double, tookLargeDamageSurvived: Double, turretPlatesTaken: Double, turretTakedowns: Double, turretsTakenWithRiftHerald: Double, twentyMinionsIn3SecondsCount: Double, twoWardsOneSweeperCount: Double, unseenRecalls: Double, visionScoreAdvantageLaneOpponent: Double, visionScorePerMinute: Double, wardTakedowns: Double, wardTakedownsBefore20M: Double, wardsGuarded: Double) {
        self._12assistStreakCount = _12assistStreakCount
        self.abilityUses = abilityUses
        self.acesBefore15Minutes = acesBefore15Minutes
        self.alliedJungleMonsterKills = alliedJungleMonsterKills
        self.baronTakedowns = baronTakedowns
        self.blastConeOppositeOpponentCount = blastConeOppositeOpponentCount
        self.bountyGold = bountyGold
        self.buffsStolen = buffsStolen
        self.completeSupportQuestInTime = completeSupportQuestInTime
        self.controlWardsPlaced = controlWardsPlaced
        self.damagePerMinute = damagePerMinute
        self.damageTakenOnTeamPercentage = damageTakenOnTeamPercentage
        self.dancedWithRiftHerald = dancedWithRiftHerald
        self.deathsByEnemyChamps = deathsByEnemyChamps
        self.dodgeSkillShotsSmallWindow = dodgeSkillShotsSmallWindow
        self.doubleAces = doubleAces
        self.dragonTakedowns = dragonTakedowns
        self.earliestDragonTakedown = earliestDragonTakedown
        self.earlyLaningPhaseGoldExpAdvantage = earlyLaningPhaseGoldExpAdvantage
        self.effectiveHealAndShielding = effectiveHealAndShielding
        self.elderDragonKillsWithOpposingSoul = elderDragonKillsWithOpposingSoul
        self.elderDragonMultikills = elderDragonMultikills
        self.enemyChampionImmobilizations = enemyChampionImmobilizations
        self.enemyJungleMonsterKills = enemyJungleMonsterKills
        self.epicMonsterKillsNearEnemyJungler = epicMonsterKillsNearEnemyJungler
        self.epicMonsterKillsWithin30SecondsOfSpawn = epicMonsterKillsWithin30SecondsOfSpawn
        self.epicMonsterSteals = epicMonsterSteals
        self.epicMonsterStolenWithoutSmite = epicMonsterStolenWithoutSmite
        self.fastestLegendary = fastestLegendary
        self.firstTurretKilled = firstTurretKilled
        self.firstTurretKilledTime = firstTurretKilledTime
        self.flawlessAces = flawlessAces
        self.fullTeamTakedown = fullTeamTakedown
        self.gameLength = gameLength
        self.getTakedownsInAllLanesEarlyJungleAsLaner = getTakedownsInAllLanesEarlyJungleAsLaner
        self.goldPerMinute = goldPerMinute
        self.hadOpenNexus = hadOpenNexus
        self.immobilizeAndKillWithAlly = immobilizeAndKillWithAlly
        self.initialBuffCount = initialBuffCount
        self.initialCrabCount = initialCrabCount
        self.jungleCsBefore10Minutes = jungleCsBefore10Minutes
        self.junglerTakedownsNearDamagedEpicMonster = junglerTakedownsNearDamagedEpicMonster
        self.kTurretsDestroyedBeforePlatesFall = kTurretsDestroyedBeforePlatesFall
        self.kda = kda
        self.killAfterHiddenWithAlly = killAfterHiddenWithAlly
        self.killParticipation = killParticipation
        self.killedChampTookFullTeamDamageSurvived = killedChampTookFullTeamDamageSurvived
        self.killingSprees = killingSprees
        self.killsNearEnemyTurret = killsNearEnemyTurret
        self.killsOnOtherLanesEarlyJungleAsLaner = killsOnOtherLanesEarlyJungleAsLaner
        self.killsOnRecentlyHealedByAramPack = killsOnRecentlyHealedByAramPack
        self.killsUnderOwnTurret = killsUnderOwnTurret
        self.killsWithHelpFromEpicMonster = killsWithHelpFromEpicMonster
        self.knockEnemyIntoTeamAndKill = knockEnemyIntoTeamAndKill
        self.landSkillShotsEarlyGame = landSkillShotsEarlyGame
        self.laneMinionsFirst10Minutes = laneMinionsFirst10Minutes
        self.laningPhaseGoldExpAdvantage = laningPhaseGoldExpAdvantage
        self.legendaryCount = legendaryCount
        self.legendaryItemUsed = legendaryItemUsed
        self.lostAnInhibitor = lostAnInhibitor
        self.maxCsAdvantageOnLaneOpponent = maxCsAdvantageOnLaneOpponent
        self.maxKillDeficit = maxKillDeficit
        self.maxLevelLeadLaneOpponent = maxLevelLeadLaneOpponent
        self.mejaisFullStackInTime = mejaisFullStackInTime
        self.moreEnemyJungleThanOpponent = moreEnemyJungleThanOpponent
        self.multiKillOneSpell = multiKillOneSpell
        self.multiTurretRiftHeraldCount = multiTurretRiftHeraldCount
        self.multikills = multikills
        self.multikillsAfterAggressiveFlash = multikillsAfterAggressiveFlash
        self.outerTurretExecutesBefore10Minutes = outerTurretExecutesBefore10Minutes
        self.outnumberedKills = outnumberedKills
        self.outnumberedNexusKill = outnumberedNexusKill
        self.perfectDragonSoulsTaken = perfectDragonSoulsTaken
        self.perfectGame = perfectGame
        self.pickKillWithAlly = pickKillWithAlly
        self.poroExplosions = poroExplosions
        self.quickCleanse = quickCleanse
        self.quickFirstTurret = quickFirstTurret
        self.quickSoloKills = quickSoloKills
        self.riftHeraldTakedowns = riftHeraldTakedowns
        self.saveAllyFromDeath = saveAllyFromDeath
        self.scuttleCrabKills = scuttleCrabKills
        self.skillshotsDodged = skillshotsDodged
        self.skillshotsHit = skillshotsHit
        self.snowballsHit = snowballsHit
        self.soloBaronKills = soloBaronKills
        self.soloKills = soloKills
        self.stealthWardsPlaced = stealthWardsPlaced
        self.survivedSingleDigitHpCount = survivedSingleDigitHpCount
        self.survivedThreeImmobilizesInFight = survivedThreeImmobilizesInFight
        self.takedownOnFirstTurret = takedownOnFirstTurret
        self.takedowns = takedowns
        self.takedownsAfterGainingLevelAdvantage = takedownsAfterGainingLevelAdvantage
        self.takedownsBeforeJungleMinionSpawn = takedownsBeforeJungleMinionSpawn
        self.takedownsFirstXMinutes = takedownsFirstXMinutes
        self.takedownsInAlcove = takedownsInAlcove
        self.takedownsInEnemyFountain = takedownsInEnemyFountain
        self.teamBaronKills = teamBaronKills
        self.teamDamagePercentage = teamDamagePercentage
        self.teamElderDragonKills = teamElderDragonKills
        self.teamRiftHeraldKills = teamRiftHeraldKills
        self.thirdInhibitorDestroyedTime = thirdInhibitorDestroyedTime
        self.tookLargeDamageSurvived = tookLargeDamageSurvived
        self.turretPlatesTaken = turretPlatesTaken
        self.turretTakedowns = turretTakedowns
        self.turretsTakenWithRiftHerald = turretsTakenWithRiftHerald
        self.twentyMinionsIn3SecondsCount = twentyMinionsIn3SecondsCount
        self.twoWardsOneSweeperCount = twoWardsOneSweeperCount
        self.unseenRecalls = unseenRecalls
        self.visionScoreAdvantageLaneOpponent = visionScoreAdvantageLaneOpponent
        self.visionScorePerMinute = visionScorePerMinute
        self.wardTakedowns = wardTakedowns
        self.wardTakedownsBefore20M = wardTakedownsBefore20M
        self.wardsGuarded = wardsGuarded
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case _12assistStreakCount = "12AssistStreakCount"
        case abilityUses
        case acesBefore15Minutes
        case alliedJungleMonsterKills
        case baronTakedowns
        case blastConeOppositeOpponentCount
        case bountyGold
        case buffsStolen
        case completeSupportQuestInTime
        case controlWardsPlaced
        case damagePerMinute
        case damageTakenOnTeamPercentage
        case dancedWithRiftHerald
        case deathsByEnemyChamps
        case dodgeSkillShotsSmallWindow
        case doubleAces
        case dragonTakedowns
        case earliestDragonTakedown
        case earlyLaningPhaseGoldExpAdvantage
        case effectiveHealAndShielding
        case elderDragonKillsWithOpposingSoul
        case elderDragonMultikills
        case enemyChampionImmobilizations
        case enemyJungleMonsterKills
        case epicMonsterKillsNearEnemyJungler
        case epicMonsterKillsWithin30SecondsOfSpawn
        case epicMonsterSteals
        case epicMonsterStolenWithoutSmite
        case fastestLegendary
        case firstTurretKilled
        case firstTurretKilledTime
        case flawlessAces
        case fullTeamTakedown
        case gameLength
        case getTakedownsInAllLanesEarlyJungleAsLaner
        case goldPerMinute
        case hadOpenNexus
        case immobilizeAndKillWithAlly
        case initialBuffCount
        case initialCrabCount
        case jungleCsBefore10Minutes
        case junglerTakedownsNearDamagedEpicMonster
        case kTurretsDestroyedBeforePlatesFall
        case kda
        case killAfterHiddenWithAlly
        case killParticipation
        case killedChampTookFullTeamDamageSurvived
        case killingSprees
        case killsNearEnemyTurret
        case killsOnOtherLanesEarlyJungleAsLaner
        case killsOnRecentlyHealedByAramPack
        case killsUnderOwnTurret
        case killsWithHelpFromEpicMonster
        case knockEnemyIntoTeamAndKill
        case landSkillShotsEarlyGame
        case laneMinionsFirst10Minutes
        case laningPhaseGoldExpAdvantage
        case legendaryCount
        case legendaryItemUsed
        case lostAnInhibitor
        case maxCsAdvantageOnLaneOpponent
        case maxKillDeficit
        case maxLevelLeadLaneOpponent
        case mejaisFullStackInTime
        case moreEnemyJungleThanOpponent
        case multiKillOneSpell
        case multiTurretRiftHeraldCount
        case multikills
        case multikillsAfterAggressiveFlash
        case outerTurretExecutesBefore10Minutes
        case outnumberedKills
        case outnumberedNexusKill
        case perfectDragonSoulsTaken
        case perfectGame
        case pickKillWithAlly
        case poroExplosions
        case quickCleanse
        case quickFirstTurret
        case quickSoloKills
        case riftHeraldTakedowns
        case saveAllyFromDeath
        case scuttleCrabKills
        case skillshotsDodged
        case skillshotsHit
        case snowballsHit
        case soloBaronKills
        case soloKills
        case stealthWardsPlaced
        case survivedSingleDigitHpCount
        case survivedThreeImmobilizesInFight
        case takedownOnFirstTurret
        case takedowns
        case takedownsAfterGainingLevelAdvantage
        case takedownsBeforeJungleMinionSpawn
        case takedownsFirstXMinutes
        case takedownsInAlcove
        case takedownsInEnemyFountain
        case teamBaronKills
        case teamDamagePercentage
        case teamElderDragonKills
        case teamRiftHeraldKills
        case thirdInhibitorDestroyedTime
        case tookLargeDamageSurvived
        case turretPlatesTaken
        case turretTakedowns
        case turretsTakenWithRiftHerald
        case twentyMinionsIn3SecondsCount
        case twoWardsOneSweeperCount
        case unseenRecalls
        case visionScoreAdvantageLaneOpponent
        case visionScorePerMinute
        case wardTakedowns
        case wardTakedownsBefore20M
        case wardsGuarded
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_12assistStreakCount, forKey: ._12assistStreakCount)
        try container.encode(abilityUses, forKey: .abilityUses)
        try container.encode(acesBefore15Minutes, forKey: .acesBefore15Minutes)
        try container.encode(alliedJungleMonsterKills, forKey: .alliedJungleMonsterKills)
        try container.encode(baronTakedowns, forKey: .baronTakedowns)
        try container.encode(blastConeOppositeOpponentCount, forKey: .blastConeOppositeOpponentCount)
        try container.encode(bountyGold, forKey: .bountyGold)
        try container.encode(buffsStolen, forKey: .buffsStolen)
        try container.encode(completeSupportQuestInTime, forKey: .completeSupportQuestInTime)
        try container.encode(controlWardsPlaced, forKey: .controlWardsPlaced)
        try container.encode(damagePerMinute, forKey: .damagePerMinute)
        try container.encode(damageTakenOnTeamPercentage, forKey: .damageTakenOnTeamPercentage)
        try container.encode(dancedWithRiftHerald, forKey: .dancedWithRiftHerald)
        try container.encode(deathsByEnemyChamps, forKey: .deathsByEnemyChamps)
        try container.encode(dodgeSkillShotsSmallWindow, forKey: .dodgeSkillShotsSmallWindow)
        try container.encode(doubleAces, forKey: .doubleAces)
        try container.encode(dragonTakedowns, forKey: .dragonTakedowns)
        try container.encode(earliestDragonTakedown, forKey: .earliestDragonTakedown)
        try container.encode(earlyLaningPhaseGoldExpAdvantage, forKey: .earlyLaningPhaseGoldExpAdvantage)
        try container.encode(effectiveHealAndShielding, forKey: .effectiveHealAndShielding)
        try container.encode(elderDragonKillsWithOpposingSoul, forKey: .elderDragonKillsWithOpposingSoul)
        try container.encode(elderDragonMultikills, forKey: .elderDragonMultikills)
        try container.encode(enemyChampionImmobilizations, forKey: .enemyChampionImmobilizations)
        try container.encode(enemyJungleMonsterKills, forKey: .enemyJungleMonsterKills)
        try container.encode(epicMonsterKillsNearEnemyJungler, forKey: .epicMonsterKillsNearEnemyJungler)
        try container.encode(epicMonsterKillsWithin30SecondsOfSpawn, forKey: .epicMonsterKillsWithin30SecondsOfSpawn)
        try container.encode(epicMonsterSteals, forKey: .epicMonsterSteals)
        try container.encode(epicMonsterStolenWithoutSmite, forKey: .epicMonsterStolenWithoutSmite)
        try container.encode(fastestLegendary, forKey: .fastestLegendary)
        try container.encode(firstTurretKilled, forKey: .firstTurretKilled)
        try container.encode(firstTurretKilledTime, forKey: .firstTurretKilledTime)
        try container.encode(flawlessAces, forKey: .flawlessAces)
        try container.encode(fullTeamTakedown, forKey: .fullTeamTakedown)
        try container.encode(gameLength, forKey: .gameLength)
        try container.encode(getTakedownsInAllLanesEarlyJungleAsLaner, forKey: .getTakedownsInAllLanesEarlyJungleAsLaner)
        try container.encode(goldPerMinute, forKey: .goldPerMinute)
        try container.encode(hadOpenNexus, forKey: .hadOpenNexus)
        try container.encode(immobilizeAndKillWithAlly, forKey: .immobilizeAndKillWithAlly)
        try container.encode(initialBuffCount, forKey: .initialBuffCount)
        try container.encode(initialCrabCount, forKey: .initialCrabCount)
        try container.encode(jungleCsBefore10Minutes, forKey: .jungleCsBefore10Minutes)
        try container.encode(junglerTakedownsNearDamagedEpicMonster, forKey: .junglerTakedownsNearDamagedEpicMonster)
        try container.encode(kTurretsDestroyedBeforePlatesFall, forKey: .kTurretsDestroyedBeforePlatesFall)
        try container.encode(kda, forKey: .kda)
        try container.encode(killAfterHiddenWithAlly, forKey: .killAfterHiddenWithAlly)
        try container.encode(killParticipation, forKey: .killParticipation)
        try container.encode(killedChampTookFullTeamDamageSurvived, forKey: .killedChampTookFullTeamDamageSurvived)
        try container.encode(killingSprees, forKey: .killingSprees)
        try container.encode(killsNearEnemyTurret, forKey: .killsNearEnemyTurret)
        try container.encode(killsOnOtherLanesEarlyJungleAsLaner, forKey: .killsOnOtherLanesEarlyJungleAsLaner)
        try container.encode(killsOnRecentlyHealedByAramPack, forKey: .killsOnRecentlyHealedByAramPack)
        try container.encode(killsUnderOwnTurret, forKey: .killsUnderOwnTurret)
        try container.encode(killsWithHelpFromEpicMonster, forKey: .killsWithHelpFromEpicMonster)
        try container.encode(knockEnemyIntoTeamAndKill, forKey: .knockEnemyIntoTeamAndKill)
        try container.encode(landSkillShotsEarlyGame, forKey: .landSkillShotsEarlyGame)
        try container.encode(laneMinionsFirst10Minutes, forKey: .laneMinionsFirst10Minutes)
        try container.encode(laningPhaseGoldExpAdvantage, forKey: .laningPhaseGoldExpAdvantage)
        try container.encode(legendaryCount, forKey: .legendaryCount)
        try container.encode(legendaryItemUsed, forKey: .legendaryItemUsed)
        try container.encode(lostAnInhibitor, forKey: .lostAnInhibitor)
        try container.encode(maxCsAdvantageOnLaneOpponent, forKey: .maxCsAdvantageOnLaneOpponent)
        try container.encode(maxKillDeficit, forKey: .maxKillDeficit)
        try container.encode(maxLevelLeadLaneOpponent, forKey: .maxLevelLeadLaneOpponent)
        try container.encode(mejaisFullStackInTime, forKey: .mejaisFullStackInTime)
        try container.encode(moreEnemyJungleThanOpponent, forKey: .moreEnemyJungleThanOpponent)
        try container.encode(multiKillOneSpell, forKey: .multiKillOneSpell)
        try container.encode(multiTurretRiftHeraldCount, forKey: .multiTurretRiftHeraldCount)
        try container.encode(multikills, forKey: .multikills)
        try container.encode(multikillsAfterAggressiveFlash, forKey: .multikillsAfterAggressiveFlash)
        try container.encode(outerTurretExecutesBefore10Minutes, forKey: .outerTurretExecutesBefore10Minutes)
        try container.encode(outnumberedKills, forKey: .outnumberedKills)
        try container.encode(outnumberedNexusKill, forKey: .outnumberedNexusKill)
        try container.encode(perfectDragonSoulsTaken, forKey: .perfectDragonSoulsTaken)
        try container.encode(perfectGame, forKey: .perfectGame)
        try container.encode(pickKillWithAlly, forKey: .pickKillWithAlly)
        try container.encode(poroExplosions, forKey: .poroExplosions)
        try container.encode(quickCleanse, forKey: .quickCleanse)
        try container.encode(quickFirstTurret, forKey: .quickFirstTurret)
        try container.encode(quickSoloKills, forKey: .quickSoloKills)
        try container.encode(riftHeraldTakedowns, forKey: .riftHeraldTakedowns)
        try container.encode(saveAllyFromDeath, forKey: .saveAllyFromDeath)
        try container.encode(scuttleCrabKills, forKey: .scuttleCrabKills)
        try container.encode(skillshotsDodged, forKey: .skillshotsDodged)
        try container.encode(skillshotsHit, forKey: .skillshotsHit)
        try container.encode(snowballsHit, forKey: .snowballsHit)
        try container.encode(soloBaronKills, forKey: .soloBaronKills)
        try container.encode(soloKills, forKey: .soloKills)
        try container.encode(stealthWardsPlaced, forKey: .stealthWardsPlaced)
        try container.encode(survivedSingleDigitHpCount, forKey: .survivedSingleDigitHpCount)
        try container.encode(survivedThreeImmobilizesInFight, forKey: .survivedThreeImmobilizesInFight)
        try container.encode(takedownOnFirstTurret, forKey: .takedownOnFirstTurret)
        try container.encode(takedowns, forKey: .takedowns)
        try container.encode(takedownsAfterGainingLevelAdvantage, forKey: .takedownsAfterGainingLevelAdvantage)
        try container.encode(takedownsBeforeJungleMinionSpawn, forKey: .takedownsBeforeJungleMinionSpawn)
        try container.encode(takedownsFirstXMinutes, forKey: .takedownsFirstXMinutes)
        try container.encode(takedownsInAlcove, forKey: .takedownsInAlcove)
        try container.encode(takedownsInEnemyFountain, forKey: .takedownsInEnemyFountain)
        try container.encode(teamBaronKills, forKey: .teamBaronKills)
        try container.encode(teamDamagePercentage, forKey: .teamDamagePercentage)
        try container.encode(teamElderDragonKills, forKey: .teamElderDragonKills)
        try container.encode(teamRiftHeraldKills, forKey: .teamRiftHeraldKills)
        try container.encode(thirdInhibitorDestroyedTime, forKey: .thirdInhibitorDestroyedTime)
        try container.encode(tookLargeDamageSurvived, forKey: .tookLargeDamageSurvived)
        try container.encode(turretPlatesTaken, forKey: .turretPlatesTaken)
        try container.encode(turretTakedowns, forKey: .turretTakedowns)
        try container.encode(turretsTakenWithRiftHerald, forKey: .turretsTakenWithRiftHerald)
        try container.encode(twentyMinionsIn3SecondsCount, forKey: .twentyMinionsIn3SecondsCount)
        try container.encode(twoWardsOneSweeperCount, forKey: .twoWardsOneSweeperCount)
        try container.encode(unseenRecalls, forKey: .unseenRecalls)
        try container.encode(visionScoreAdvantageLaneOpponent, forKey: .visionScoreAdvantageLaneOpponent)
        try container.encode(visionScorePerMinute, forKey: .visionScorePerMinute)
        try container.encode(wardTakedowns, forKey: .wardTakedowns)
        try container.encode(wardTakedownsBefore20M, forKey: .wardTakedownsBefore20M)
        try container.encode(wardsGuarded, forKey: .wardsGuarded)
    }
}
