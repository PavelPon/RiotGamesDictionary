//
//  DictionaryStore.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 10.01.2024.
//


import ComposableArchitecture
import LoLDictionaryNetwork
import Foundation
@Reducer
struct DictionaryStore  {
    
    @Dependency(\.dictionaryNetwork) var dictionaryNetwork
    @Dependency(\.keychainService) var keychainService

    @ObservableState
    struct State :Equatable{
        var version = ""
        var localization = ""
        var champions:[ChampionObj] = []
        var championsSearch:[ChampionObj] = []
        var runes:[RuneObjSlotsInnerRunesInner] = []
        var runesSearch:[RuneObjSlotsInnerRunesInner] = []
        var summoners:[SummonerObj] = []
        var summonersSearch:[SummonerObj] = []
        var isLoading:Bool = true
        var path = StackState<Path.State>()
        var offsetScroll:CGFloat = 0
        var showSearchView:Bool = false
        var selectTab:DictionaryTabs = .champions
        var tabs:[DictionaryTabs] = [.champions,.items,.runes,.summoners]
        var searchText:String = ""
    }
    
    enum Action{
        case onAppear
        case successData(([ChampionObj],[RuneObjSlotsInnerRunesInner],[SummonerObj]))
        case failureData(String)
        case path(StackAction<Path.State, Path.Action>)
        case setOffsetScroll(CGFloat)
        case setShowSearchView(Bool)
        case tabSelected(DictionaryTabs)
        case searchChampions([ChampionObj])
        case searchRunes([RuneObjSlotsInnerRunesInner])
        case searchSummoners([SummonerObj])
        case searchTextChange(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if state.version == keychainService.service.get(key: StringResources.keyVersionDictionary) ?? "-1" && state.localization == keychainService.service.get(key: StringResources.keyLocalization) ?? "-1"{
                    return .none
                }
                state.version = keychainService.service.get(key: StringResources.keyVersionDictionary) ?? ""
                state.localization = keychainService.service.get(key: StringResources.keyLocalization) ?? ""
                state.isLoading = true
                return .run {[state] send in
                    let resultChampions =  await dictionaryNetwork.getChampions(state.version, state.localization)
                    let resultRunes =  await dictionaryNetwork.getRunes(state.version, state.localization)
                    let resultSummoners =  await dictionaryNetwork.getSummoners(state.version, state.localization)
                    
                    if resultChampions.1 != nil {
                        await send(.failureData(resultChampions.1?.localizedDescription ?? "error"))
                    }
                    if resultRunes.1 != nil {
                        await send(.failureData(resultRunes.1?.localizedDescription ?? "error"))
                    }
                    
                    if resultSummoners.1 != nil {
                        await send(.failureData(resultRunes.1?.localizedDescription ?? "error"))
                    }
                    
                    await send(.successData((resultChampions.0,resultRunes.0,resultSummoners.0)))
                }
            case .successData(let data):
                state.isLoading = false
                state.champions = data.0
                state.championsSearch = data.0
                state.runes = data.1
                state.runesSearch = data.1
                state.summoners = data.2
                state.summonersSearch = data.2
                return .none
            case .searchChampions(let champions):
                state.championsSearch = champions
                return .none
            case .failureData(_):
                state.isLoading = false
                return .none
            case .path:
                return .none
            case .setOffsetScroll(let offset):
                state.offsetScroll = offset
                return .none
            case .setShowSearchView(let show):
                state.showSearchView = show
                return .none
            case .tabSelected(let tab):
                state.selectTab = tab
                return .none
            case .searchTextChange(let text):
                state.searchText = text
                
                switch state.selectTab {
                case .champions:
                    if text.isEmpty {
                        return .send(.searchChampions(state.champions))
                    }
                    return .send(.searchChampions(state.champions.filter({
                        
                        $0.name.contains(text) || $0.id.contains(text)
                        
                    })))
                   
                case .items:
                    break
                case .runes:
                    if text.isEmpty {
                        return .send(.searchRunes(state.runes))
                    }
                    return .send(.searchRunes(state.runes.filter({
                        guard let name = $0.name, let key = $0.key else {return false}
                        return name.contains(text) || key.contains(text)
                    })))
                case .summoners:
                    if text.isEmpty {
                        return .send(.searchSummoners(state.summoners))
                    }
                    return .send(.searchSummoners(state.summoners.filter({
                        return $0.name.contains(text) || $0.id.contains(text)
                    })))
                }
                
                
                return .none
            case .searchRunes(let runes):
                state.runesSearch = runes
                return .none
            case .searchSummoners(let summoners):
                state.summonersSearch = summoners
                return .none
            }
            
        }
        .forEach(\.path, action: \.path) {
            Path()
          }
    }
    
    
    @Reducer
    struct Path {
      @ObservableState
      enum State: Equatable {
          case screenChampionDetail(ChampionDetailStore.State = .init(id: ""))
          case screenRuneDetail(RuneDetailStore.State = .init(rune: RuneObjSlotsInnerRunesInner()))
          case screenSummonerDetail(SummonerDetailStore.State = .init(summoner: nil))
          case screenSettings(SettingsStore.State = .init())
          case screenGamesHome(GamesHomeStore.State = .init())
      }

      enum Action {
        case screenChampionDetail(ChampionDetailStore.Action)
        case screenRuneDetail(RuneDetailStore.Action)
        case screenSummonerDetail(SummonerDetailStore.Action)
        case screenSettings(SettingsStore.Action)
        case screenGamesHome(GamesHomeStore.Action)
      }

      var body: some Reducer<State, Action> {
          Scope(state: \.screenChampionDetail, action: \.screenChampionDetail) {
              ChampionDetailStore()
          }
          Scope(state: \.screenRuneDetail, action: \.screenRuneDetail) {
              RuneDetailStore()
          }
          Scope(state: \.screenSummonerDetail, action: \.screenSummonerDetail) {
              SummonerDetailStore()
          }
          Scope(state: \.screenSettings, action: \.screenSettings) {
              SettingsStore()
          }
          
          Scope(state: \.screenGamesHome, action: \.screenGamesHome) {
              GamesHomeStore()
          }
      }
    }
    
    
}
