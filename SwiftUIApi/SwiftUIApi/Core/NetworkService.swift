//
//  NetworkService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 30.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import NetworkModule

protocol INetworkService {
    func get<T: Codable>(type: RequestType, params: [String: Any], completion: @escaping ((_ data: T?,_ error: Error?) -> Void))
}

enum RequestType {
    case cardList
    case card
    case pokemonList
    case pokemon
}

class NetworkService: INetworkService {
    
    func get<T: Codable>(type: RequestType, params: [String: Any], completion: @escaping ((_ data: T?,_ error: Error?) -> Void)) {
        switch type {
        case .cardList:
            guard let compl = completion as? (CardsList?, Error?) -> Void else {
                completion(nil, CustomApiError.invalidType)
                return
            }
            CardsAPI.getAllCards(page: params["page"] as? Int, pageSize: params["pageSize"] as? Int, completion: compl)
        case .card:
            guard let id = params["id"] as? String, let compl = completion as? (CardItem?, Error?) -> Void else {
                completion(nil, CustomApiError.invalidType)
                return
            }
            CardsIdAPI.getCardById(id: id, completion: compl)
        case .pokemonList:
            guard let compl = completion as? (PokemonList?, Error?) -> Void else {
                completion(nil, CustomApiError.invalidType)
                return
            }
            PokemonAPI.getPokemonList(limit: params["limit"] as? Int, offset: params["offset"] as? Int, completion: compl)
        case .pokemon:
            guard let name = params["name"] as? String, let compl = completion as? (Pokemon?, Error?) -> Void else {
                completion(nil, CustomApiError.invalidType)
                return
            }
            PokemonNameAPI.getPokemonByName(name: name, completion: compl)
        }
    }
}
//
//extension NetworkService {
//    
//    static var injected: INetworkService? {
//        let ser: INetworkService? = ServiceLocator.shared.getService(type: INetworkService.self)
//        return ser
//    }
//}

enum CustomApiError: Error {
    case invalidType
    
    var localizedDescription: String {
        switch self {
        case .invalidType:
            return "Invalid type"
        }
    }
}
