//
//  GamesHomeScreen.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 13.02.2024.
//

import SwiftUI
import ComposableArchitecture
struct GamesHomeScreen: View {
    let store:StoreOf<GamesHomeStore>
    
    var body: some View {
        Text("Hello, World! + \(store.textInfoError)")
            .onAppear{
                store.send(.onAppear)
            }
    }
    
    
    @ViewBuilder
    func GamesHomeCell() -> some View{
        HStack{}
    }
    
}




