//
// PokemonType.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PokemonType: Codable { 


    public var type: ModelType?
    public var slot: Int?

    public init(type: ModelType?, slot: Int?) {
        self.type = type
        self.slot = slot
    }

}