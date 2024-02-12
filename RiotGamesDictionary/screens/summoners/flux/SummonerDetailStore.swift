//
//  SummonerDetailStore.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 09.02.2024.
//

import Foundation
import LoLDictionaryNetwork
import ComposableArchitecture


@Reducer
struct SummonerDetailStore{
    @Dependency(\.keychainService) var keychainService
    
    @ObservableState
    struct State:Equatable{
        let summoner:SummonerObj?
        var version = ""
        var localization = ""
    }
    
    enum Action{
        case onAppear
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.version = keychainService.service.get(key: StringResources.keyVersionDictionary) ?? ""
                state.localization = keychainService.service.get(key: StringResources.keyLocalization) ?? ""
                return .none
            }
        }
    }
    
}

