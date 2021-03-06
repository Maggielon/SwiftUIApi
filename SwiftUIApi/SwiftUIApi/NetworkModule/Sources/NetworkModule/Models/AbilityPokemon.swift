//
// AbilityPokemon.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct AbilityPokemon: Codable { 


    public var isHidden: Bool?
    public var slot: Int?
    public var pokemon: Pokemon?

    public init(isHidden: Bool?, slot: Int?, pokemon: Pokemon?) {
        self.isHidden = isHidden
        self.slot = slot
        self.pokemon = pokemon
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case isHidden = "is_hidden"
        case slot
        case pokemon
    }

}
