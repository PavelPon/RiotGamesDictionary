//
//  RiotGamesDictionaryApp.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 13.12.2023.
//

import SwiftUI
//import DIProject
import ComposableArchitecture
import LoLDictionaryNetwork
import SwiftData
@main
struct RiotGamesDictionaryApp: App {
    @Dependency(\.keychainService) var keychainService
    @Dependency(\.obfuscatorService) var obfuscatorService
    @Dependency(\.databaseService) var databaseService
    var modelContext: ModelContext {
        guard let modelContext = try? self.databaseService.context() else {
            fatalError("Could not find modelcontext")
        }
        return modelContext
    }
    init(){

       //obfuscatorService.service.bytesByObfuscatingString(string: "RGAPI-794dd587-0287-42fb-838b-3feba3d3a483")

        if keychainService.service.get(key: StringResources.keyVersionDictionary) == nil {
            keychainService.service.set(key: StringResources.keyVersionDictionary, value: "13.23.1")
        }
        if keychainService.service.get(key: StringResources.keyLocalization) == nil {
            keychainService.service.set(key: StringResources.keyLocalization, value: "ru_RU")
        }
        if keychainService.service.get(key: StringResources.keyRiotRequestKey) == nil {
            keychainService.service.set(key: StringResources.keyRiotRequestKey, value: obfuscatorService.service.reveal(key: obfuscatorService.service.riotAPIKey))
        }
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
                RootView(store: Store(initialState: RootStore.State(), reducer: {RootStore()}))
                .modelContext(self.modelContext)
        }
    }
}

