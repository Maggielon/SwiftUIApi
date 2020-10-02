//
//  ServiceLocator.swift
//  SwiftUIApi
//
//  Created by Анастасия on 30.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

protocol IServiceLocator {
    
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

public class ServiceLocator: IServiceLocator {
    
    public static let shared = ServiceLocator()
    
    private var services: [String: Any] = [String: Any]()
    
    public func getService<T>(type: T.Type) -> T? {
        return services[String(describing: type)] as? T
    }
    
    public func addService<T>(service: T) {
        let type = String(describing: T.self)
        if services[type] == nil {
            services[type] = service
        }
    }
}
