//
//  RootStore.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 29.01.2024.
//

import Foundation
import ComposableArchitecture
@Reducer
struct RootStore {
@ObservableState
    struct State :Equatable{
        var selectTab:TabRoot = .dictionary
    }
    
    enum Action{
case actionTab(TabRoot)
    }
     
    enum TabRoot {
        case dictionary
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .actionTab(let tab):
                state.selectTab = tab
                return .none
            }
        }
    }
    

}
