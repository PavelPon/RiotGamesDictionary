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
}
extension DependencyValues {
  var acountNetwork: LoLAcountNetworkService {
    get { self[LoLAcountNetworkService.self] }
    set { self[LoLAcountNetworkService.self] = newValue }
  }
}
extension LoLAcountNetworkService:DependencyKey{
    static var liveValue: LoLAcountNetworkService  = {
        //    OpenAPIClientAPI.requestBuilderFactory = URLSessionRequestBuilderFactoryLoLDictionary()
        return Self(
            getUserData: { summonerName, apiKey in
                guard let data = try? await DataSummonerNameAPI.getDataSummonerName(summonerName: summonerName, apiKey: apiKey) else{
                    return (nil,CancellationError())
                }
                return (data,nil)
            })
    }()
}
