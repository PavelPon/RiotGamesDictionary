//
//  GamesHomeStuct.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 18.02.2024.
//

import Foundation
import AccountRiotApiNetwork
struct ModelMatchInfoFinal: Identifiable,Hashable {
    var id:UUID = .init()
    var summoderData:ModelMatchInfoInfoParticipantsInner?
    var modelMatchInfo: ModelMatchInfo
}

extension ModelMatchInfo: Identifiable {
    public var id: ModelMatchInfoMetadata {metadata}
}

extension ModelMatchInfoMetadata: Identifiable {
    public var id: String { matchId }
}
