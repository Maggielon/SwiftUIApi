//
// TypePokemon.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct TypePokemon: Codable { 


    public var slot: Int?
    public var pokemon: Pokemon?

    public init(slot: Int?, pokemon: Pokemon?) {
        self.slot = slot
        self.pokemon = pokemon
    }

}
