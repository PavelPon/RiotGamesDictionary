//
//  ObfuscatorService.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 11.02.2024.
//

import Foundation
import ComposableArchitecture
struct ObfuscatorService {
    var service:Obfuscator
}

extension DependencyValues {
  var obfuscatorService: ObfuscatorService {
    get { self[ObfuscatorService.self] }
    set { self[ObfuscatorService.self] = newValue }
  }
}

extension ObfuscatorService:DependencyKey{
    static var liveValue: ObfuscatorService  = Self(service: Obfuscator())
}
