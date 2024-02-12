//
//  RuneDetailStore.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 09.02.2024.
//

import Foundation
import LoLDictionaryNetwork
import ComposableArchitecture

@Reducer
struct RuneDetailStore {
    @Dependency(\.keychainService) var keychainService
    
    @ObservableState
    struct State:Equatable{
        var rune:RuneObjSlotsInnerRunesInner
    }
    
    enum Action{
        case onAppear
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}
