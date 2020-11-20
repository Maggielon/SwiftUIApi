//
// Pokemon.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import RealmSwift

public class Pokemon: RealmSwift.Object, Codable {


    public var abilities = RealmSwift.List<PokemonAbility>()
    public var baseExperience: RealmOptional<Int> = .init(nil)
    public var forms = RealmSwift.List<PokemonForm>()
    public var gameIndices = RealmSwift.List<VersionGameIndex>()
    public var height: RealmOptional<Int> = .init(nil)
    public var id: RealmOptional<Int> = .init(nil)
    public var isDefault: RealmOptional<Bool> = .init(nil)
    @objc dynamic public var locationAreaEncounters: String?
    public var moves = RealmSwift.List<PokemonMove>()
    @objc dynamic public var name: String?
    public var order: RealmOptional<Int> = .init(nil)
    @objc dynamic public var sprites: PokemonSprites?
    @objc dynamic public var species: PokemonSpecies?
    public var weight: RealmOptional<Int> = .init(nil)

    public required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.abilities.append(objectsIn: (try? container.decode([PokemonAbility].self, forKey: .abilities)) ?? [])
        self.baseExperience = .init(try? container.decode(Int.self, forKey: .baseExperience))
        self.forms.append(objectsIn: (try? container.decode([PokemonForm].self, forKey: .forms)) ?? [])
        self.gameIndices.append(objectsIn: (try? container.decode([VersionGameIndex].self, forKey: .gameIndices)) ?? [])
        self.height = .init(try? container.decode(Int.self, forKey: .height))
        self.id = .init(try? container.decode(Int.self, forKey: .id))
        self.isDefault = .init(try? container.decode(Bool.self, forKey: .isDefault))
        self.locationAreaEncounters = try? container.decode(String.self, forKey: .locationAreaEncounters)
        self.moves.append(objectsIn: (try? container.decode([PokemonMove].self, forKey: .moves)) ?? [])
        self.name = try? container.decode(String.self, forKey: .name)
        self.order = .init(try? container.decode(Int.self, forKey: .order))
        self.sprites = try? container.decode(PokemonSprites.self, forKey: .sprites)
        self.species = try? container.decode(PokemonSpecies.self, forKey: .species)
        self.weight = .init(try? container.decode(Int.self, forKey: .weight))
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
        case weight
    }
    
    override public class func primaryKey() -> String? {
        return "name"
    }
}
