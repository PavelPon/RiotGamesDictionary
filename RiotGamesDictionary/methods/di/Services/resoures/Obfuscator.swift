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
    
    let riotAPIKey: [UInt8] = [34, 63, 49, 40, 57, 85, 71, 65, 68, 28, 20, 77, 72, 79, 93, 72, 66, 64, 71, 85, 68, 74, 22, 26, 93, 64, 67, 64, 18, 85, 67, 30, 21, 26, 17, 75, 20, 75, 17, 76, 72, 75]
     
    init() {}
    
    @_optimize(none)
    private func salt() -> String {
        typealias C = Character
        let a1: C, a2: C
        (a1, a2) = ("x", "p")
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
