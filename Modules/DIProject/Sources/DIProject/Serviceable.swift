//
//  File.swift
//  
//
//  Created by Павел Пономарёв on 08.01.2024.
//

import Foundation

public protocol Serviceable {}

public struct MainRegisterItem {
    let type:TypeRegister
    let registerObject:Serviceable
    
    public init(type: TypeRegister, registerObject: Serviceable) {
        self.type = type
        self.registerObject = registerObject
    }
}

public enum TypeRegister{
    case factory,singleton
}
