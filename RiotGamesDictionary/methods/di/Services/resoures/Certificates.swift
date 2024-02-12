//
//  Certificates.swift
//  AppSUI2308
//
//  Created by Exey Panteleev on 23.11.2023.
//

import Foundation
import Security
import CommonCrypto
import DIProject
final class Certificates: Serviceable {
    
    var isCertificatePinningMethod1: Bool = true

    
    var riotsApi: SecCertificate?
    var riotApiPermanentKey: String = "hORxyzowIo/j2rk2oGduHnpgOL+J9Lzxh3UwM2PYDx8="
    
    init() {
        riotsApi = try? certificate(filename: "ddragon.leagueoflegends.com.cer")
    }
    
    func certificate(filename: String) throws -> SecCertificate? {
        if let filePath = Bundle.main.path(forResource: filename, ofType: "cer") {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return SecCertificateCreateWithData(nil, data as CFData)
        }
        return nil
    }

    // to public domain pinning
    
    let rsa2048Asn1Header:[UInt8] = [
        0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
        0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
    ]
    
    func sha256(data : Data) -> String {
        var keyWithHeader = Data(rsa2048Asn1Header)
        keyWithHeader.append(data)
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        keyWithHeader.withUnsafeBytes {
            _ = CC_SHA256($0, CC_LONG(keyWithHeader.count), &hash)
        }
        return Data(hash).base64EncodedString()
    }

}
