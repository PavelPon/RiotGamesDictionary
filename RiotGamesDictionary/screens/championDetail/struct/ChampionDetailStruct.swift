//
//  ChampionDetailStruct.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 08.02.2024.
//

import Foundation

struct ChampionStatsItem:Identifiable,Equatable {
    let id:UUID = .init()
    let title:String
    let value:Double
}
struct ChampionSkinItem:Identifiable,Equatable {
    let id:UUID = .init()
    let url:String
}
