//
//  SettingsStore.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 12.02.2024.
//

import Foundation
import ComposableArchitecture
import AccountRiotApiNetwork
import SwiftData


@Reducer
struct SettingsStore{
    @Dependency(\.keychainService) var keychainService
    @Dependency(\.acountNetwork) var acountNetwork
    @Dependency(\.obfuscatorService) var obfuscatorService
    @Dependency(\.swiftData) var context
    @ObservableState
    struct State:Equatable{
        var localization = ""
        var version = ""
        var keyRiot = ""
        
        var selectedLocalization:ItemLocalization = ItemLocalization(title: "", value: "")
        var selectedVersion:String = ""
        

        var listVersion:[String] = ["14.3.1","14.2.1","14.1.1","13.24.1","13.23.1"]
        var listLocalization:[ItemLocalization] = [ItemLocalization(title:"Russia",value:"ru_RU"),ItemLocalization(title:"United Kingdom",value:"en_GB"),ItemLocalization(title:"Korea",value:"ko_KR")]
        
        var isLoading:Bool = false
        
        var searchSummonerName = ""
        
        var players:[Player] = []
        var selectedPlayer:Player = .init(id: .init(), name: "-", PUUID: "")
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
        
        case queryChangedPlayers([Player])
        case actionPlayer(Player)
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
                
                if let keychainPUUID = keychainService.service.get(key: StringResources.keyPUUID){
                    do {
                       let players =  try context.fetchAll()
                        players.forEach { item in
                            if item.PUUID == keychainPUUID {
                                state.selectedPlayer = item
                            }
                        }
                        state.players = players
                    } catch { }
                }
                
                state.keyRiot = keychainService.service.get(key: StringResources.keyRiotRequestKey) ?? ""
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
                    let data  = await acountNetwork.getUserData(state.searchSummonerName.trimmingCharacters(in: .whitespacesAndNewlines),state.keyRiot)
                    
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
                do {
                    let unreleasedPlayer = FetchDescriptor<Player>(predicate: #Predicate { player in
                        player.PUUID == userData.puuid
                    })
                    let data = try context.fetch(unreleasedPlayer)
                    
                    if data.isEmpty{
                        
                        let addPlayer:Player = .init(id: .init(), name: userData.name, PUUID: userData.puuid)
                        try context.add(addPlayer)
                        state.selectedPlayer = addPlayer
                        
                        keychainService.service.set(key: StringResources.keyPUUID, value: userData.puuid)
                        keychainService.service.set(key: StringResources.keySummonerName, value: userData.name)
                        
                        let data =  try context.fetchAll()
                        return .send(.queryChangedPlayers(data))
                    }
                } catch {}

                return.none
            case .failureRequestSummonerName(_):
                state.isLoading = false
                return .send(.alertButtonTapped("Not search account"))
            case .deleteAccountData:
                do {
                    try context.delete(state.selectedPlayer)
                } catch { }

                do {
                   let list =  try context.fetchAll()
                    if !list.isEmpty {
                        state.selectedPlayer = list.first!
                        keychainService.service.set(key: StringResources.keyPUUID, value: list.first!.PUUID)
                        keychainService.service.set(key: StringResources.keySummonerName, value: list.first!.name)
                    }else{
                        state.selectedPlayer = .init(id: .init(), name: "-", PUUID: "")
                        keychainService.service.delete(StringResources.keyPUUID)
                        keychainService.service.delete(StringResources.keySummonerName)
                    }
                    return .send(.queryChangedPlayers(list))
                } catch { }
                
                
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
                
            case .queryChangedPlayers(let list):
                state.players = list
                return .none
                
            case .actionPlayer(let player):
                state.selectedPlayer = player
                keychainService.service.set(key: StringResources.keyPUUID, value: player.PUUID)
                keychainService.service.set(key: StringResources.keySummonerName, value: player.name)
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
        
    
}
