//
//  DictionaryStruct.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 07.02.2024.
//

import Foundation
struct DictionaryTabItem: Equatable{
    var title:String
    var hint:String
    var systemIconName:String
}
enum DictionaryTabs {
    case champions
    case items
    case runes
    case summoners
    public var instance: DictionaryTabItem {
           switch self {
           case .champions:
               return .init(title: "Чемпионы", hint: "Поиск по чемпионам", systemIconName: "person.3.fill")
           case .items:
               return .init(title: "Предметы", hint: "Поиск по предметам", systemIconName: "square.split.2x2.fill")
           case .runes:
               return .init(title: "Руны", hint: "Поиск по рунам", systemIconName: "sparkles")
           case .summoners:
               return .init(title: "Саммонеры", hint: "Поиск по саммонерам", systemIconName: "bolt.fill")
           }
       }
}

