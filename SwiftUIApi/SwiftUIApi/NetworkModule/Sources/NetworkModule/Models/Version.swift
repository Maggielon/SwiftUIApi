//
// Version.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Version: Codable { 


    public var id: Int?
    public var name: String?
    public var names: [Name]?
    public var versionGroup: VersionGroup?

    public init(id: Int?, name: String?, names: [Name]?, versionGroup: VersionGroup?) {
        self.id = id
        self.name = name
        self.names = names
        self.versionGroup = versionGroup
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case names
        case versionGroup = "version_group"
    }

}