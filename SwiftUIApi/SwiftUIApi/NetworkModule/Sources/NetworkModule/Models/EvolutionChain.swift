//
// EvolutionChain.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct EvolutionChain: Codable { 


    public var id: Int?
    public var babyTriggerItem: Item?

    public init(id: Int?, babyTriggerItem: Item?) {
        self.id = id
        self.babyTriggerItem = babyTriggerItem
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case babyTriggerItem = "baby_trigger_item"
    }

}