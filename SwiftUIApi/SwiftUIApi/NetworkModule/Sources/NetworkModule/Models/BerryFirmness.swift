//
// BerryFirmness.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct BerryFirmness: Codable { 


    public var id: Int?
    public var name: String?
    public var berries: [Berry]?
    public var names: [Name]?

    public init(id: Int?, name: String?, berries: [Berry]?, names: [Name]?) {
        self.id = id
        self.name = name
        self.berries = berries
        self.names = names
    }

}
