//
// PokemonSpecies.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import RealmSwift

public class PokemonSpecies: RealmSwift.Object, Codable {
    
    @objc dynamic public var name: String?
    
    public convenience init(id: Int?) {
        self.init()
        
        self.name = name
    }
}
