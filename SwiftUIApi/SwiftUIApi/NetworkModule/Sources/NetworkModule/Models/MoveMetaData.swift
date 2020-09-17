//
// MoveMetaData.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct MoveMetaData: Codable { 


    public var ailment: MoveAilment?
    public var minHits: Int?
    public var maxHits: Int?
    public var minTurns: Int?
    public var maxTurns: Int?
    public var drain: Int?
    public var healing: Int?
    public var critRate: Int?
    public var ailmentChance: Int?
    public var flinchChance: Int?
    public var statChance: Int?

    public init(ailment: MoveAilment?, minHits: Int?, maxHits: Int?, minTurns: Int?, maxTurns: Int?, drain: Int?, healing: Int?, critRate: Int?, ailmentChance: Int?, flinchChance: Int?, statChance: Int?) {
        self.ailment = ailment
        self.minHits = minHits
        self.maxHits = maxHits
        self.minTurns = minTurns
        self.maxTurns = maxTurns
        self.drain = drain
        self.healing = healing
        self.critRate = critRate
        self.ailmentChance = ailmentChance
        self.flinchChance = flinchChance
        self.statChance = statChance
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case ailment
        case minHits = "min_hits"
        case maxHits = "max_hits"
        case minTurns = "min_turns"
        case maxTurns = "max_turns"
        case drain
        case healing
        case critRate = "crit_rate"
        case ailmentChance = "ailment_chance"
        case flinchChance = "flinch_chance"
        case statChance = "stat_chance"
    }

}
