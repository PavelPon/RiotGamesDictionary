//
//  SettingsStore.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 12.02.2024.
//

import Foundation
import ComposableArchitecture
import AccountRiotApiNetwork


@Reducer
struct SettingsStore{
    @Dependency(\.keychainService) var keychainService
    @Dependency(\.acountNetwork) var acountNetwork
    @ObservableState
    struct State:Equatable{
        var localization = ""
        var version = ""
        
        var selectedLocalization:ItemLocalization = ItemLocalization(title: "", value: "")
        var selectedVersion:String = ""
        

        var listVersion:[String] = ["14.3.1","14.2.1","14.1.1","13.24.1","13.23.1"]
        var listLocalization:[ItemLocalization] = [ItemLocalization(title:"Russia",value:"ru_RU"),ItemLocalization(title:"United Kingdom",value:"en_GB"),ItemLocalization(title:"Korea",value:"ko_KR")]
        
        var isLoading:Bool = false

        
        var searchSummonerName = ""
        var titleName = ""
        
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action{
        case onAppear
        case popToRoot
        case actionLocalization(ItemLocalization)
        case actionVersion(String)
        
        case setSearchSummonerName(String)
        case actionRequestSummonerName
        case deleteAccountData
        
        case successSummonerName(SummonerByName)
        case failureRequestSummonerName(String)
        
        case alert(PresentationAction<Alert>)
        case alertButtonTapped(String)
        
        enum Alert {
          case incrementButtonTapped
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.version = keychainService.service.get(key: StringResources.keyVersionDictionary) ?? ""
                state.localization = keychainService.service.get(key: StringResources.keyLocalization) ?? ""
                state.titleName = keychainService.service.get(key: StringResources.keySummonerName) ?? "-"
                state.listLocalization.forEach { item in
                    if item.value == state.localization{
                        state.selectedLocalization = item
                    }
                }  
                state.listVersion.forEach { item in
                    if item == state.version{
                        state.selectedVersion = item
                    }
                }
                return .none
            case .popToRoot:
                return .none
            case .setSearchSummonerName(let name):
                state.searchSummonerName = name
                return .none
            case .actionRequestSummonerName:
                state.isLoading = true
                return .run {[state] send in
                  let data  = await acountNetwork.getUserData(state.searchSummonerName,"RGAPI-8878c150-a7ae-4610-93a2-230f49bc8d73")
                    
                    if data.1 != nil{
                        await send(.failureRequestSummonerName(data.1?.localizedDescription ?? "error"))
                    }
                    
                    if let data = data.0 {
                        await send(.successSummonerName(data))
                    }else{
                        await send(.failureRequestSummonerName("error"))
                    }
                    
                }
            case .actionLocalization(let loc):
                state.version = loc.value
                state.selectedLocalization = loc
                keychainService.service.set(key: StringResources.keyLocalization, value: loc.value)
                return .none
            case .actionVersion(let ver):
                state.version = ver
                state.selectedVersion = ver
                keychainService.service.set(key: StringResources.keyVersionDictionary, value: ver)
                return .none
            case .successSummonerName(let userData):
                state.isLoading = false
                state.titleName = userData.name
                keychainService.service.set(key: StringResources.keyPUUID, value: userData.puuid)
                keychainService.service.set(key: StringResources.keySummonerName, value: userData.name)
                return.none
            case .failureRequestSummonerName(let error):
                state.isLoading = false
                return .send(.alertButtonTapped("Not search account"))
            case .deleteAccountData:
                keychainService.service.delete(StringResources.keyPUUID)
                keychainService.service.delete(StringResources.keySummonerName)
                state.titleName = keychainService.service.get(key: StringResources.keySummonerName) ?? "-"
                return .none
                
                
            case .alert(.presented(.incrementButtonTapped)):
                    state.alert = AlertState { TextState("Incremented!") }
                    return .none

                  case .alert:
                    return .none

                  case .alertButtonTapped(let message):
                    state.alert = AlertState {
                      TextState("Внимание!")
                    } actions: {
                      ButtonState(action: .incrementButtonTapped) {
                        TextState("Ok")
                      }
                    } message: {
                      TextState(message)
                    }
                    return .none
                
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
        
    
}
