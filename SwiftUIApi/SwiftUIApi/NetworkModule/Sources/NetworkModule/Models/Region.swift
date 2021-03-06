//
// Region.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Region: Codable { 


    public var id: Int?
    public var name: String?
    public var locations: [Location]?
    public var names: [Name]?
    public var pokedexes: [Pokedex]?
    public var versionGroups: [VersionGroup]?

    public init(id: Int?, name: String?, locations: [Location]?, names: [Name]?, pokedexes: [Pokedex]?, versionGroups: [VersionGroup]?) {
        self.id = id
        self.name = name
        self.locations = locations
        self.names = names
        self.pokedexes = pokedexes
        self.versionGroups = versionGroups
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case locations
        case names
        case pokedexes
        case versionGroups = "version_groups"
    }

}
