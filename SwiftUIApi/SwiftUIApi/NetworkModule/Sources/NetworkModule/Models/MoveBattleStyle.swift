//
// MoveBattleStyle.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct MoveBattleStyle: Codable { 


    public var id: Int?
    public var name: String?
    public var names: [Name]?

    public init(id: Int?, name: String?, names: [Name]?) {
        self.id = id
        self.name = name
        self.names = names
    }

}
