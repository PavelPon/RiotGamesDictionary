//
//  KeychainService.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 08.02.2024.
//

import Foundation
import ComposableArchitecture

struct KeychainService {
    var service:Keychain
}

extension DependencyValues {
  var keychainService: KeychainService {
    get { self[KeychainService.self] }
    set { self[KeychainService.self] = newValue }
  }
}

extension KeychainService:DependencyKey{
    static var liveValue: KeychainService  = Self(service: Keychain())
}






