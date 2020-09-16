//
//  PokemonCardModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 15.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation

// MARK: - PokemonCardList
struct PokemonCardList: Codable {
    let cards: [Card]?
}

// MARK: - Card
struct Card: Codable {
    let id, name: String?
    let nationalPokedexNumber: Int?
    let imageURL, imageURLHiRes: String?
    let types: [String]?
    let supertype: Supertype?
    let subtype, evolvesFrom, hp, number: String?
    let artist, rarity, series, cardSet: String?
    let setCode: String?
    let attacks: [Attack]?
    let weaknesses: [Resistance]?
    let retreatCost: [RetreatCost]?
    let convertedRetreatCost: Int?
    let resistances: [Resistance]?
    let text: [String]?
    let ability: Ability?

    enum CodingKeys: String, CodingKey {
        case id, name, nationalPokedexNumber
        case imageURL = "imageUrl"
        case imageURLHiRes = "imageUrlHiRes"
        case types, supertype, subtype, evolvesFrom, hp, number, artist, rarity, series
        case cardSet = "set"
        case setCode, attacks, weaknesses, retreatCost, convertedRetreatCost, resistances, text, ability
    }
    
    init(name: String) {
        self.id = nil
        self.name = name
        self.nationalPokedexNumber = nil
        self.types = []
        self.imageURL = nil
        self.imageURLHiRes = nil
        self.setCode = nil
        self.subtype = nil
        self.evolvesFrom = nil
        self.hp = nil
        self.number = nil
        self.artist = nil
        self.attacks = nil
        self.weaknesses = nil
        self.retreatCost = nil
        self.convertedRetreatCost = nil
        self.resistances = nil
        self.text = nil
        self.ability = nil
        self.supertype = nil
        self.rarity = nil
        self.series = nil
        self.cardSet = nil 
    }
}

extension Card: Identifiable {
}

// MARK: - Ability
struct Ability: Codable {
    let name, text, type: String?
}

// MARK: - Attack
struct Attack: Codable {
    let cost: [String]?
    let name, text, damage: String?
    let convertedEnergyCost: Int?
}

// MARK: - Resistance
struct Resistance: Codable {
    let type, value: String?
}

enum RetreatCost: String, Codable {
    case colorless = "Colorless"
}

enum Supertype: String, Codable {
    case pokemon = "Pokémon"
    case trainer = "Trainer"
    case energy = "Energy"
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func pokemonCardListTask(with url: URL, completionHandler: @escaping (PokemonCardList?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
