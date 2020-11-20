//
//  DataBaseService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 19.11.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import RealmSwift
import Foundation

public protocol IDataBaseService {
    var readRealm: Realm? { get set }
    var newRealm: Realm? { get }
}

public class DataBaseService: IDataBaseService {
    
    public var readRealm: Realm?
    
    public var newRealm: Realm? {
        let configuration = self.makeCardsConfiguration(readOnly: false)
        return try? Realm(configuration: configuration)
    }
    
    public init() {
        let configuration = self.makeCardsConfiguration(readOnly: false)
        self.readRealm = try? Realm(configuration: configuration)
    }
}

extension DataBaseService {
    
    func makeCardsConfiguration(readOnly: Bool) -> Realm.Configuration {
        
        let config = Realm.Configuration(
            fileURL: cardsFileUrl(),
            schemaVersion: 1
        )
        return config
    }
    
    func cardsFileUrl() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("pokemons.realm")
    }
}
