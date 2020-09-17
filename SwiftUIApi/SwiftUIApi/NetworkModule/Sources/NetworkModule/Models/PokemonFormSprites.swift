//
// PokemonFormSprites.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PokemonFormSprites: Codable { 


    public var frontDefault: String?
    public var frontShiny: String?
    public var backDefault: String?
    public var backShiny: String?

    public init(frontDefault: String?, frontShiny: String?, backDefault: String?, backShiny: String?) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.backDefault = backDefault
        self.backShiny = backShiny
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
    }

}
