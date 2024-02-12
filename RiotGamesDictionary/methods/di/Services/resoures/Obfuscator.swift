//
//  Obfuscator.swift
//  AppSUI2308
//
//  Created by Exey Panteleev on 23.11.2023.
//

import Foundation
import DIProject

extension String {
    
    func characters() -> [Character] {
        self.map { $0 }
    }
}

final class Obfuscator: Serviceable {
    
    // f88288f4bca14599a2334cadfb3d6f4b
    let newsAPIKey: [UInt8] = [4, 89, 90, 83, 90, 89, 4, 85, 0, 2, 3, 80, 86, 84, 91, 88, 3, 83, 81, 82, 86, 2, 3, 5, 4, 3, 81, 5, 84, 7, 86, 3]
     
    init() {}
    
    @_optimize(none)
    private func salt() -> String {
        typealias C = Character
        let a1: C, a2: C
        (a1, a2) = ("a", "b")
        return String("00".characters().enumerated().map { i, e in
            if i == 0 { return a2 }
            else { return a1 }
        })
    }
    
    // MARK: - Instance Methods
    #if DEBUG
    func bytesByObfuscatingString(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](salt().utf8)
        let length = cipher.count
        
        var encrypted = [UInt8]()
        
        for t in text.enumerated() {
            encrypted.append(t.element ^ cipher[t.offset % length])
        }
        
        #if DEBUG
        print("Salt used: \(salt())\n")
        print("Swift Code:\n************")
        print("// Original \"\(string)\"")
        print("let key: [UInt8] = \(encrypted)\n")
        #endif
        
        return encrypted
    }
    #endif
    
    func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](salt().utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for k in key.enumerated() {
            decrypted.append(k.element ^ cipher[k.offset % length])
        }
        
        return String(bytes: decrypted, encoding: .utf8)!
    }
    
}
