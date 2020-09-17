//
// ItemHolderPokemon.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct ItemHolderPokemon: Codable { 


    public var pokemon: Pokemon?
    public var versionDetails: [ItemHolderPokemonVersionDetail]?

    public init(pokemon: Pokemon?, versionDetails: [ItemHolderPokemonVersionDetail]?) {
        self.pokemon = pokemon
        self.versionDetails = versionDetails
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case pokemon
        case versionDetails = "version_details"
    }

}
