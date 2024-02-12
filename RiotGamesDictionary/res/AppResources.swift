//
//  AppResources.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 05.02.2024.
//

import Foundation
import SwiftUI

public class StringResources {
   static let keyVersionDictionary = "keyVersionDictionary"
   static let keyLocalization = "keyVersionLocalization"
   static let keyPUUID = "keyPUUID"
   static let keySummonerName = "keySummonerName"
}

public class ColorResources {
    static let color1 = Color(cgColor: rgbColorInint(red: 9, green: 20, blue: 40, alpha: 1.0))
    static let color2 = Color(cgColor: rgbColorInint(red: 10, green: 50, blue: 60, alpha: 1.0))
    static let color3 = Color(cgColor: rgbColorInint(red: 0, green: 90, blue: 130, alpha: 1.0))

}

func rgbColorInint(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> CGColor {
   return CGColor(red: (red/255), green: (green/255), blue: (blue/255), alpha: alpha)
}


extension String {
    
    func urlIconChampion(version:String) -> String {
        return "https://ddragon.leagueoflegends.com/cdn/\(version)/img/champion/\(self).png"
    }
    
    func urlsplashChampion(num:Double = 0) -> String {
        return "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(self)_\(Int(num)).jpg"
    }
    func urlIconRune() -> String {
        return "https://ddragon.leagueoflegends.com/cdn/img/\(self)"
    }
    
    func urlIconSummoner(version:String) -> String {
        return "https://ddragon.leagueoflegends.com/cdn/\(version)/img/spell/\(self).png"
    }
    func urlIcon(version:String,group:String) -> String {
        return "https://ddragon.leagueoflegends.com/cdn/\(version)/img/\(group)/\(self)"
    }
}
