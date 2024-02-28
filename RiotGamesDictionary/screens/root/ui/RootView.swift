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
            DictionaryScreen(store: Store(initialState:DictionaryStore.State(), reducer: {DictionaryStore()})).frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}


