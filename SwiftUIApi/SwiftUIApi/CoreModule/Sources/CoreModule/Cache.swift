//
//  Cache.swift
//  SwiftUIApi
//
//  Created by Анастасия on 04.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

public protocol ICache {
    
    subscript<T, U: Hashable>(key: U) -> T? { get set }
    
    func set<T, U: Hashable>(
        _ value: T?,
        forKey key: U,
        expireAfter: DispatchTimeInterval
    )
    
    func get<T, U: Hashable>(_ key: U) -> T?
    
    func drop()
}

public class Cache: ICache {

    private struct ExpirableValue {

        let validUntil: DispatchTime
        let value: Any
    }

    private let serialQueue: DispatchQueue = DispatchQueue(label: "Cache.serialQueue")

    private var store: [String: ExpirableValue] = [:]

    public subscript<T, U: Hashable>(key: U) -> T? {
        get { return self.get(key) }
        set { self.set(newValue, forKey: key) }
    }
    
    public init() { }

    public func set<T, U: Hashable>(
        _ value: T?,
        forKey key: U,
        expireAfter: DispatchTimeInterval = .never
    ) {
        let storeKey = self.makeKey(valueType: T.self, key: key)
        let validUntil: DispatchTime = expireAfter == .never
            ? .distantFuture
            : .now() + expireAfter
        self.serialQueue.sync {
            self.store[storeKey] = value.flatMap { ExpirableValue(
                validUntil: validUntil,
                value: $0
            ) }
        }
    }

    public func get<T, U: Hashable>(_ key: U) -> T? {
        let storeKey = self.makeKey(valueType: T.self, key: key)
        guard let expirableValue = self.serialQueue.sync(execute: { self.store[storeKey] }),
              let value = expirableValue.value as? T,
              expirableValue.validUntil > .now()
            else { return nil }

        return value
    }

    public func drop() {
        self.serialQueue.sync {
            self.store.removeAll()
        }
    }

    private func makeKey<T, U: Hashable>(valueType: T.Type, key: U) -> String {
        return "\(U.self).\(key.hashValue).\(valueType)"
    }
}

extension DispatchTimeInterval {

    static func minutes(_ minutes: Int) -> DispatchTimeInterval {
        return .seconds(minutes * 60)
    }
}
