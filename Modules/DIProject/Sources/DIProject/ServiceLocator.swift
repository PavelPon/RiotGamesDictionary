//
//  ServiceLocator.swift
//  SwiftUI_MVVMS
//
//  Created by exey on 21.04.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import Foundation





public final class ServiceLocator {

    private var registry = [ObjectIdentifier: Any]()
    public static var shared: ServiceLocator = .init()

    public init() {
    
    }

    // MARK: - Declaration

    public func registerMainServices(registers: @escaping (ServiceLocator) -> Void) {
        registers(ServiceLocator.shared)
        // REGISTERING SERVICES
        //registerSingleton(singletonInstance: CoreSecureStorageService())
        //registerSingleton(singletonInstance: Analytics())
        
//        register(factory: {
//            Certificates()
//        })
//        register(factory: {
//            Obfuscator()
//        })
//        register(factory: {
//            Keychain()
//        })
    }

    // MARK: - Registration

    public func register<Service>(factory: @escaping () -> Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = factory
    }

    public func registerSingleton<Service>(singletonInstance: Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = singletonInstance
    }

    // MARK: - Injection

    public func inject<Service>() -> Service {
        let serviceId = ObjectIdentifier(Service.self)
        if let factory = registry[serviceId] as? () -> Service {
            return factory()
        } else  {
            return registry[serviceId] as! Service
        }
    }
}
