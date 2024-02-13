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
                print(datalistIDs)
                var matchesList:[ModelMatchInfo] = []
                
                for ii in 0..<datalistIDs.count {
                    let item = try? await DataMatchInfoAPI.getDataMatchInfo(matchId: datalistIDs[ii], apiKey: key)
                    if let item = item {
                        matchesList.append(item)
                    }
                }
                return (matchesList,nil)
            }, getMatchForId: {id,key in
                OpenAPIClientAPI.basePath = "https://euw1.api.riotgames.com"
                guard let data = try? await DataMatchInfoAPI.getDataMatchInfo(matchId: id, apiKey: key) else{
                    return (nil,CancellationError())
                }
                return (data,nil)
            })
    }()
}
