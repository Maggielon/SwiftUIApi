//
// PastMoveStatValues.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PastMoveStatValues: Codable { 


    public var accuracy: Int?
    public var effectChance: Int?
    public var power: Int?
    public var pp: Int?
    public var effectEntries: [VerboseEffect]?
    public var type: ModelType?
    public var versionGroup: VersionGroup?

    public init(accuracy: Int?, effectChance: Int?, power: Int?, pp: Int?, effectEntries: [VerboseEffect]?, type: ModelType?, versionGroup: VersionGroup?) {
        self.accuracy = accuracy
        self.effectChance = effectChance
        self.power = power
        self.pp = pp
        self.effectEntries = effectEntries
        self.type = type
        self.versionGroup = versionGroup
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case accuracy
        case effectChance = "effect_chance"
        case power
        case pp
        case effectEntries = "effect_entries"
        case type
        case versionGroup = "version_group"
    }

}