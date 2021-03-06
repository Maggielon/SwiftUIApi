//
// Nature.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Nature: Codable { 


    public var id: Int?
    public var name: String?
    public var decreasedStat: Stat?
    public var increasedStat: Stat?
    public var hatesFlavor: BerryFlavor?
    public var likesFlavor: BerryFlavor?
    public var pokeathlonStatChanges: [NatureStatChange]?
    public var moveBattleStylePreferences: [MoveBattleStylePreference]?
    public var names: [Name]?

    public init(id: Int?, name: String?, decreasedStat: Stat?, increasedStat: Stat?, hatesFlavor: BerryFlavor?, likesFlavor: BerryFlavor?, pokeathlonStatChanges: [NatureStatChange]?, moveBattleStylePreferences: [MoveBattleStylePreference]?, names: [Name]?) {
        self.id = id
        self.name = name
        self.decreasedStat = decreasedStat
        self.increasedStat = increasedStat
        self.hatesFlavor = hatesFlavor
        self.likesFlavor = likesFlavor
        self.pokeathlonStatChanges = pokeathlonStatChanges
        self.moveBattleStylePreferences = moveBattleStylePreferences
        self.names = names
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case decreasedStat = "decreased_stat"
        case increasedStat = "increased_stat"
        case hatesFlavor = "hates_flavor"
        case likesFlavor = "likes_flavor"
        case pokeathlonStatChanges = "pokeathlon_stat_changes"
        case moveBattleStylePreferences = "move_battle_style_preferences"
        case names
    }

}
