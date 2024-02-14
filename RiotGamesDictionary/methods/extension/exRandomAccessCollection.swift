//
//  exRandomAccessCollection.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 14.02.2024.
//

import Foundation
extension RandomAccessCollection where Self.Element:Identifiable{
    func isLimitElements<Item:Identifiable>(_ item:Item) -> Bool{
        guard isEmpty == false else {return false}
        guard let itemIndex = firstIndex(where: {AnyHashable($0.id) == AnyHashable(item.id)})else {return false}
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 2
    }
}
