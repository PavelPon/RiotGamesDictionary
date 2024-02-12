//
//  ContentView.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 13.12.2023.
//

import SwiftUI
import DIProject
import ComposableArchitecture

struct RootView: View {
    var store:StoreOf<RootStore>
    var body: some View {
        WithPerceptionTracking{
//            TabView(selection: $store.selectTab.sending(\.actionTab)) {
//                DictionaryScreen(store: Store(initialState:DictionaryStore.State(), reducer: {DictionaryStore()})).frame(maxWidth: .infinity,maxHeight: .infinity)
//                    .tabItem {
//                        Label("Menu", systemImage: "list.dash")
//                    }.tag(RootStore.TabRoot.dictionary)
//            }
            DictionaryScreen(store: Store(initialState:DictionaryStore.State(), reducer: {DictionaryStore()})).frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}


