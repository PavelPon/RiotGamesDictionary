//
//  GamesHomeStore.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 13.02.2024.
//

import Foundation
import ComposableArchitecture
import AccountRiotApiNetwork
@Reducer
struct GamesHomeStore{
    @Dependency(\.acountNetwork) var acountNetwork
    @Dependency(\.obfuscatorService) var obfuscatorService
    @Dependency(\.keychainService) var keychainService
    
    @ObservableState
    struct State:Equatable{
        var version = ""
        var localization = ""
        var name = ""
        var accountPUUID = ""
        var titleScreen = ""
        var isLoading = false
        var isShowTextInfoError = false
        var textInfoError = ""
        var index = 0
        var count = 20
        var listGames:[ModelMatchInfo] = []
    }
    
    enum Action{
        case onAppear
        case successData([ModelMatchInfo])
        case failureData(String)
        case requestListGames
        case paginationListGames
    }
    
    var body: some ReducerOf<Self>{
        Reduce{state,action in
            switch action {
            case .onAppear:
                state.version = keychainService.service.get(key: StringResources.keyVersionDictionary) ?? ""
                state.localization = keychainService.service.get(key: StringResources.keyLocalization) ?? ""
                state.name = keychainService.service.get(key: StringResources.keySummonerName) ?? ""
                state.accountPUUID = keychainService.service.get(key: StringResources.keyPUUID) ?? ""
                
                if state.accountPUUID.isEmpty{
                    return.send(.failureData("There is no saved account, add it to the \"Settings\" category"))
                }
                
                return .send(.requestListGames)
            case .requestListGames:
                state.isLoading = true
                let match = Bundle.main.decode(ModelMatchInfo.self, from: "data.json")
                return.send(.successData([match]))
//                return.run { [state] send in
//                    
//                    
//                    
//                    
////                    let resultMatches =  await acountNetwork.getMatches(state.accountPUUID,state.index,state.count,obfuscatorService.service.reveal(key: obfuscatorService.service.riotAPIKey))    
//                    
//                    let resultMatches =  await acountNetwork.getMatchForId("EUW1_6807651027",obfuscatorService.service.reveal(key: obfuscatorService.service.riotAPIKey))
//                    if resultMatches.1 != nil {
//                        await send(.failureData(resultMatches.1?.localizedDescription ?? "error Request"))
//                    } else {
//                        await send(.successData([resultMatches.0!]))
//                    }
//                }
            case .successData(let mathes):
                state.isLoading = false
                if mathes.isEmpty {
                    return.send(.failureData("Game list is empty"))
                }
                state.isShowTextInfoError = false
                state.listGames = mathes
                return.none
            case .failureData(let error):
                state.isLoading = false
                state.isShowTextInfoError = true
                state.textInfoError = error
                return.none
            case .paginationListGames:
                state.index += 1
                return .send(.requestListGames)
            }
        }
    }
}
