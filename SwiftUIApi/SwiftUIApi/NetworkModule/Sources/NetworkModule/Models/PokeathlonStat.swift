//
// PokeathlonStat.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PokeathlonStat: Codable { 


    public var id: Int?
    public var name: String?
    public var names: [Name]?
    public var affectingNatures: NaturePokeathlonStatAffectSets?

    public init(id: Int?, name: String?, names: [Name]?, affectingNatures: NaturePokeathlonStatAffectSets?) {
        self.id = id
        self.name = name
        self.names = names
        self.affectingNatures = affectingNatures
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case names
        case affectingNatures = "affecting_natures"
    }

}
