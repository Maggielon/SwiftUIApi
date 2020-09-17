//
// MoveFlavorText.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct MoveFlavorText: Codable { 


    public var flavorText: String?
    public var language: Language?
    public var versionGroup: VersionGroup?

    public init(flavorText: String?, language: Language?, versionGroup: VersionGroup?) {
        self.flavorText = flavorText
        self.language = language
        self.versionGroup = versionGroup
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }

}