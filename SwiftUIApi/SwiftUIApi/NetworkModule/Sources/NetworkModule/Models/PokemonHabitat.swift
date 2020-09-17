//
// PokemonHabitat.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PokemonHabitat: Codable { 


    public var id: Int?
    public var name: String?
    public var names: [Name]?
    public var pokemonSpecies: [PokemonSpecies]?

    public init(id: Int?, name: String?, names: [Name]?, pokemonSpecies: [PokemonSpecies]?) {
        self.id = id
        self.name = name
        self.names = names
        self.pokemonSpecies = pokemonSpecies
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case names
        case pokemonSpecies = "pokemon_species"
    }

}
