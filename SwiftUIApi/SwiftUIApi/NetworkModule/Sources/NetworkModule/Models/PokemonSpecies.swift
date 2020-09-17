//
// PokemonSpecies.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct PokemonSpecies: Codable { 


    public var id: Int?
    public var name: String?
    public var order: Int?
    public var genderRate: Int?
    public var captureRate: Int?
    public var baseHappiness: Int?
    public var isBaby: Bool?
    public var hatchCounter: Int?
    public var hasGenderDifferences: Bool?
    public var formsSwitchable: Bool?
    public var growthRate: GrowthRate?
    public var pokedexNumbers: [PokemonSpeciesDexEntry]?
    public var eggGroups: [EggGroup]?
    public var color: PokemonColor?
    public var shape: PokemonShape?
    public var habitat: PokemonHabitat?
    public var generation: Generation?
    public var names: [Name]?
    public var palParkEncounters: [PalParkEncounterArea]?
    public var flavorTextEntries: [FlavorText]?
    public var formDescriptions: [Description]?
    public var genera: [Genus]?
    public var varieties: [PokemonSpeciesVariety]?

    public init(id: Int?, name: String?, order: Int?, genderRate: Int?, captureRate: Int?, baseHappiness: Int?, isBaby: Bool?, hatchCounter: Int?, hasGenderDifferences: Bool?, formsSwitchable: Bool?, growthRate: GrowthRate?, pokedexNumbers: [PokemonSpeciesDexEntry]?, eggGroups: [EggGroup]?, color: PokemonColor?, shape: PokemonShape?, habitat: PokemonHabitat?, generation: Generation?, names: [Name]?, palParkEncounters: [PalParkEncounterArea]?, flavorTextEntries: [FlavorText]?, formDescriptions: [Description]?, genera: [Genus]?, varieties: [PokemonSpeciesVariety]?) {
        self.id = id
        self.name = name
        self.order = order
        self.genderRate = genderRate
        self.captureRate = captureRate
        self.baseHappiness = baseHappiness
        self.isBaby = isBaby
        self.hatchCounter = hatchCounter
        self.hasGenderDifferences = hasGenderDifferences
        self.formsSwitchable = formsSwitchable
        self.growthRate = growthRate
        self.pokedexNumbers = pokedexNumbers
        self.eggGroups = eggGroups
        self.color = color
        self.shape = shape
        self.habitat = habitat
        self.generation = generation
        self.names = names
        self.palParkEncounters = palParkEncounters
        self.flavorTextEntries = flavorTextEntries
        self.formDescriptions = formDescriptions
        self.genera = genera
        self.varieties = varieties
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case name
        case order
        case genderRate = "gender_rate"
        case captureRate = "capture_rate"
        case baseHappiness = "base_happiness"
        case isBaby = "is_baby"
        case hatchCounter = "hatch_counter"
        case hasGenderDifferences = "has_gender_differences"
        case formsSwitchable = "forms_switchable"
        case growthRate = "growth_rate"
        case pokedexNumbers = "pokedex_numbers"
        case eggGroups = "egg_groups"
        case color
        case shape
        case habitat
        case generation
        case names
        case palParkEncounters = "pal_park_encounters"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case genera
        case varieties
    }

}