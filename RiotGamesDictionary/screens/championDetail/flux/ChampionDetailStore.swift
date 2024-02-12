//
//  ChampionDetailStore.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 02.02.2024.
//

import Foundation
import ComposableArchitecture
import LoLDictionaryNetwork
@Reducer
struct ChampionDetailStore{
    
    @Dependency(\.dictionaryNetwork) var dictionaryNetwork
    @Dependency(\.keychainService) var keychainService
    
    @ObservableState
    struct State:Equatable {
        var id:String
        var isLoading:Bool = false
        var championDetailObj:ChampionDetailObj? = nil
        var championStats:[ChampionStatsItem] = []
        var titleStats:String = ""
        var titleSpells:String = "Spells:"
        var version =  ""
        var localization =  ""
        var championSkins:[ChampionSkinItem] = []
        //Skins ScrollViewParams
        var showDetailSkinsView = false
        var selectedSkin:UUID?
        var detailScrollPosition:UUID?
        var scrollPositionRootView:UUID?
    }
    
    enum Action{
        case onAppear
        case successDataChampionDetail(ChampionDetailObj)
        case failureDataChampionDetail(String)
        case actionSelectedSkin(UUID?)
        case actionScrollPositionSkin(UUID?)
        case actionScrollPositionRootView(UUID?)
        case actionShowSkinView(Bool)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                state.version = keychainService.service.get(key: StringResources.keyVersionDictionary) ?? ""
                state.localization = keychainService.service.get(key: StringResources.keyLocalization) ?? ""
                state.isLoading = true
                return .run {[state] send in
                    let result =  await dictionaryNetwork.getChampionDetail(state.version, state.localization, state.id)
                
                    if result.1 != nil {
                        await send(.failureDataChampionDetail(result.1?.localizedDescription ?? "error"))
                    }
                    
                    if let data = result.0 {
                        await send(.successDataChampionDetail(data))
                    }
                    await send(.failureDataChampionDetail("error"))
                }
            case .successDataChampionDetail(let data):
                
                let srtAllStats = data.stats
                let vAllStats = Mirror(reflecting: srtAllStats)
                let stats:[ChampionStatsItem] = vAllStats.children.map { item in
                    return  ChampionStatsItem(title: item.label ?? "", value: item.value as? Double ?? 0)
                }
                let skins:[ChampionSkinItem] = data.skins.map { item  in
                    return  ChampionSkinItem(url: state.id.urlsplashChampion(num: item.num ?? 0))
                }
                state.titleStats =  stats.isEmpty ? "" : "Stats:"
                state.championStats = stats
                state.championSkins = skins
                state.isLoading = false
                state.championDetailObj = data
                return .none
            case .failureDataChampionDetail(_):
                state.isLoading = false
                return .none
            case .actionSelectedSkin(let skin):
                state.selectedSkin = skin
                state.showDetailSkinsView = skin == nil ? false : true
                if skin == nil {
                    state.detailScrollPosition = nil
                    return .send(.actionShowSkinView(skin == nil ? false : true))
                }
                return .send(.actionShowSkinView(skin == nil ? false : true))
            case .actionShowSkinView(let show):
                state.showDetailSkinsView = show
                return . none
            case .actionScrollPositionSkin(let position):
                state.detailScrollPosition = position
                return . none
            case .actionScrollPositionRootView(let position):
                state.scrollPositionRootView = position
                return . none
            }
            
        }}
}
