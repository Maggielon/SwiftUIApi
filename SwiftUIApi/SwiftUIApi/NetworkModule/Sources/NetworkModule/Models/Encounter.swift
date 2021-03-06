//
// Encounter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Encounter: Codable { 


    public var minLevel: Int?
    public var maxLevel: Int?
    public var conditionValues: [EncounterConditionValue]?
    public var chance: Int?
    public var method: EncounterMethod?

    public init(minLevel: Int?, maxLevel: Int?, conditionValues: [EncounterConditionValue]?, chance: Int?, method: EncounterMethod?) {
        self.minLevel = minLevel
        self.maxLevel = maxLevel
        self.conditionValues = conditionValues
        self.chance = chance
        self.method = method
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case minLevel = "min_level"
        case maxLevel = "max_level"
        case conditionValues = "condition_values"
        case chance
        case method
    }

}
