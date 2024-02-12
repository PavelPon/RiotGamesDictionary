//
//  SettingsStruct.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 12.02.2024.
//

import Foundation


struct ItemLocalization:Identifiable , Equatable,Hashable{
    var id:UUID = .init()
    var title:String
    var value:String
}


