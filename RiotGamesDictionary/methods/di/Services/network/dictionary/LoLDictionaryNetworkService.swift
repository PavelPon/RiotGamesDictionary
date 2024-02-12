//
//  RiotNetworkService.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 09.01.2024.
//

import Foundation
import DIProject
import LoLDictionaryNetwork
import ComposableArchitecture

struct LoLDictionaryNetworkService {
    var getChampions:(String,String) async  -> ([ChampionObj],Error?)
    var getChampionDetail:(String,String,String) async  -> (ChampionDetailObj?,Error?)
    var getRunes:(String,String) async  -> ([RuneObjSlotsInnerRunesInner],Error?)
    var getSummoners:(String,String) async  -> ([SummonerObj],Error?)
}

extension DependencyValues {
  var dictionaryNetwork: LoLDictionaryNetworkService {
    get { self[LoLDictionaryNetworkService.self] }
    set { self[LoLDictionaryNetworkService.self] = newValue }
  }
}

extension LoLDictionaryNetworkService:DependencyKey{
    static var liveValue: LoLDictionaryNetworkService  = {
        OpenAPIClientAPI.requestBuilderFactory = URLSessionRequestBuilderFactoryLoLDictionary()
        return Self(
            getChampions: {version,localization in
                guard let data = try? await DataChampionsAPI.getDataChampions(version: version, localization: localization) else{
                    return ([],CancellationError())
                }
                   
                let srtAllChampions = data.data
                let vAllChampions = Mirror(reflecting: srtAllChampions)
                let champions:[ChampionObj] = vAllChampions.children.map { item in
                    return item.value as! ChampionObj
                }
                
                return (champions,nil)
            }, getChampionDetail: {version,localization,id in
                guard let data = try? await DetailChampionAPI.getChampionDetail(version: version, localization: localization, name: id) else{
                    return (nil,CancellationError())
                }
               
                switch(data.data){
                case .typeAatroxChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAhriChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAkaliChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAkshanChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAlistarChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAmumuChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAniviaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAnnieChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeApheliosChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAsheChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAurelionSolChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeAzirChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBardChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBelvethChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBlitzcrankChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBrandChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBraumChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeBriarChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeCaitlynChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeCamilleChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeCassiopeiaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeChogathChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeCorkiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeDariusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeDianaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeDrMundoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeDravenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeEkkoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeEliseChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeEvelynnChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeEzrealChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeFiddlesticksChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeFioraChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeFizzChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGalioChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGangplankChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGarenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGnarChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGragasChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGravesChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeGwenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeHecarimChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeHeimerdingerChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeIllaoiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeIreliaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeIvernChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJannaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJarvanIVChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJaxChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJayceChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJhinChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeJinxChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKSanteChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKaisaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKalistaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKarmaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKarthusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKassadinChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKatarinaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKayleChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKaynChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKennenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKhazixChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKindredChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKledChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeKogMawChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLeblancChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLeeSinChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLeonaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLilliaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLissandraChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLucianChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLuluChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeLuxChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMalphiteChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMalzaharChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMaokaiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMasterYiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMilioChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMissFortuneChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMonkeyKingChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMordekaiserChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeMorganaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNaafiriChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNamiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNasusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNautilusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNeekoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNidaleeChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNilahChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNocturneChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeNunuChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeOlafChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeOriannaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeOrnnChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typePantheonChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typePoppyChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typePykeChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeQiyanaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeQuinnChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRakanChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRammusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRekSaiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRellChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRenataChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRenektonChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRengarChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRivenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRumbleChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeRyzeChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSamiraChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSejuaniChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSennaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSeraphineChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSettChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeShacoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeShenChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeShyvanaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSingedChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSionChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSivirChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSkarnerChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSonaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSorakaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSwainChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSylasChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeSyndraChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTahmKenchChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTaliyahChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTalonChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTaricChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTeemoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeThreshChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTristanaChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTrundleChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTryndamereChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTwistedFateChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeTwitchChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeUdyrChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeUrgotChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVarusChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVayneChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVeigarChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVelkozChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVexChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeViChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeViegoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeViktorChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVladimirChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeVolibearChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeWarwickChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeXayahChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeXerathChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeXinZhaoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeYasuoChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeYoneChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeYorickChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeYuumiChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZacChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZedChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZeriChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZiggsChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZileanChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZoeChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                case .typeZyraChampionDetailObj(let value):
                    return (Mirror(reflecting: value).children.first?.value as? ChampionDetailObj ,nil)
                }
            }, getRunes: { version,localization in
                guard let data = try? await DetailRunesAPI.getRunes(version: version, localization: localization) else{
                    return ([],CancellationError())
                }
                var objs:[RuneObjSlotsInnerRunesInner] = []
                data.forEach { line in
                    line.slots.forEach { r in
                        objs.append(contentsOf: r.runes ?? [])
                    }
                }
                return (objs,nil)
            }, getSummoners: { version,localization in
                guard let data = try? await DataSummonerAPI.getDataSummoners(version: version, localization: localization) else{
                    return ([],CancellationError())
                }
                
                let srtAllSummoner = data.data
                let vAllSummoner = Mirror(reflecting: data.data)
                let summoner:[SummonerObj] = vAllSummoner.children.map { item in
                    return item.value as! SummonerObj
                }
                return (summoner,nil)
            }
        )
    }()
}

