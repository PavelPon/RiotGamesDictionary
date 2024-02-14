//
//  LoLAcountNetworkService.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 12.02.2024.
//

import Foundation
import AccountRiotApiNetwork
import Dependencies
struct LoLAcountNetworkService {
    var getUserData:(String,String) async  -> (SummonerByName?,Error?)
    var getMatches:(String,Int,Int,String) async  -> ([ModelMatchInfo],Error?)
    var getMatchForId:(String,String) async  -> (ModelMatchInfo?,Error?)
}
extension DependencyValues {
  var acountNetwork: LoLAcountNetworkService {
    get { self[LoLAcountNetworkService.self] }
    set { self[LoLAcountNetworkService.self] = newValue }
  }
}
extension LoLAcountNetworkService:DependencyKey{
    static var liveValue: LoLAcountNetworkService  = {
            OpenAPIClientAPI.requestBuilderFactory = URLSessionRequestBuilderFactoryLoLAccount()
        return Self(
            getUserData: { summonerName, apiKey in
                OpenAPIClientAPI.basePath = "https://euw1.api.riotgames.com"
                guard let data = try? await DataSummonerNameAPI.getDataSummonerName(summonerName: summonerName, apiKey: apiKey) else{
                    return (nil,CancellationError())
                }
                return (data,nil)
            }, getMatches: { puuid,index,count,key in
                OpenAPIClientAPI.basePath = "https://europe.api.riotgames.com"
                guard let datalistIDs =  try? await DataListMatchesAPI.getDataMatchesList(puuid: puuid, apiKey: key,start: index, count: count) else{
                    return ([],CancellationError())
                }

//                    var result = [ModelMatchInfo?]()
//                    for id in datalistIDs {
//                        async let data = try? DataMatchInfoAPI.getDataMatchInfo(matchId: id, apiKey: key)
//                        await result.append(data)
//                    }
                var result = try? await loadMatchsGroup(ids: datalistIDs, key: key)
                var listMaches = result?.compactMap{$0}
                    
                return (listMaches ?? [],nil)
            }, getMatchForId: {id,key in
                OpenAPIClientAPI.basePath = "https://europe.api.riotgames.com"
                guard let data = try? await DataMatchInfoAPI.getDataMatchInfo(matchId: id, apiKey: key) else{
                    return (nil,CancellationError())
                }
                return (data,nil)
            })
    }()
}

func loadMatchsGroup(ids:[String],key:String) async throws ->[ModelMatchInfo?] {
    var result = [ModelMatchInfo?]()
    let group = try await withThrowingTaskGroup(of: ModelMatchInfo?.self) { group -> [ModelMatchInfo?] in
        for id in ids {
            group.addTask {
              try? await DataMatchInfoAPI.getDataMatchInfo(matchId: id, apiKey: key)
            }
        }
        for try await item in group {
            result.append(item)
        }
        return result
    }
    return group
}
