//
//  CertificatesService.swift
//  RiotGamesDictionary
//
//  Created by Павел Пономарёв on 11.02.2024.
//

import Foundation
import ComposableArchitecture
struct CertificatesService {
    var service:Certificates
}

extension DependencyValues {
  var certificatesService: CertificatesService {
    get { self[CertificatesService.self] }
    set { self[CertificatesService.self] = newValue }
  }
}

extension CertificatesService:DependencyKey{
    static var liveValue: CertificatesService  = Self(service: Certificates())
}
