//
// BerryFlavor.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct BerryFlavor: Codable { 


    public var id: Int?
    public var name: String?
    public var berries: [FlavorBerryMap]?
    public var contestType: ContestType?
    public var names: [Name]?

    public init(id: Int?, name: String?, berries: [FlavorBerryMap]?, contestType: ContestType?, names: [Name]?) {
        self.id = id
        self.name = name
        self.berries = berries
        self.contestType = contestType
        self.names = names
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case berries
        case contestType = "contest_type"
        case names
    }

}
