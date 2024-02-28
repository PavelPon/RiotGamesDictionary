//
//  SettingsScreen.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 12.02.2024.
//

import SwiftUI
import ComposableArchitecture
import SwiftData
struct SettingsScreen: View {
    @Bindable var  store:StoreOf<SettingsStore>
    
    @Query(FetchDescriptor<Player>()) var playerQuery: [Player] {
        didSet {
            store.send(.queryChangedPlayers(self.allMovies)) // ????/
        }
    }
    
    var body: some View {
        Form{
            Section {
                Text("Saved account: \(store.titleName)")
                    .foregroundColor(.white)
                
                TextField("Name",text: $store.searchSummonerName.sending(\.setSearchSummonerName))
                    .tint(.white)
                    .foregroundColor(.white)
                
                Button(action: {
                    store.send(.actionRequestSummonerName)
                }, label: {
                    Text("Get data account")
                })
                
                Button(action: {
                    store.send(.deleteAccountData)
                }, label: {
                    Text("Delete data account")
                })
                
            } header: {
                Text("Account data EUW*")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            .listRowBackground(ColorResources.color1)
            
            Section {
                Picker("Localization:", selection: $store.selectedLocalization.sending(\.actionLocalization)) {
                    ForEach(store.listLocalization,id:\.self) { item in
                            Text("\(item.title)")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                    }
                    
                }.foregroundColor(.white)
    
            } header: {
                Text("localization data")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            .listRowBackground(ColorResources.color1)
            
            Section {
                
                Picker("Versions:", selection: $store.selectedVersion.sending(\.actionVersion)) {
                     ForEach(store.listVersion,id:\.self) { item in
                         Text("\(item)")
                             .font(.system(size: 13))
                             .foregroundColor(.white)
                     }
                 }.foregroundColor(.white)
                
                
                
            } header: {
                Text("version data")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            .listRowBackground(ColorResources.color1)
        }
        .onAppear {
            store.send(.onAppear)
        }
        .background {
            Rectangle()
                .fill(ColorResources.color2.gradient)
                .ignoresSafeArea(.all)
        }
        .scrollContentBackground(.hidden)
        .overlay{
            if store.isLoading{
                HStack{
                    ProgressView()
                }
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .background(Color.black.opacity(0.2))
            }
        }
        .navigationTitle("Settings")
        .alert($store.scope(state: \.alert, action: \.alert))
        .tint(ColorResources.color4)
    }
}

