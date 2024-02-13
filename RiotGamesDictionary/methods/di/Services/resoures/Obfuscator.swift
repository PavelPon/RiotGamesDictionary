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
    
    let riotAPIKey: [UInt8] = [34, 63, 49, 40, 57, 85, 69, 72, 72, 78, 20, 65, 69, 65, 93, 29, 66, 29, 19, 85, 68, 25, 22, 64, 93, 64, 71, 75, 72, 85, 20, 65, 68, 76, 68, 27, 17, 72, 21, 29, 70, 72]
     
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
