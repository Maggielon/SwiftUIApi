//
//  API.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine
import NetworkModule

enum API {
    
    enum RequestType {
        case pokemon
        case card
        
        var base: URL {
            switch self {
            case .pokemon:
                return URL(string: "https://pokeapi.co/api/v2/pokemon")!
            case .card:
                return URL(string: "https://api.pokemontcg.io/v1/cards")!
            }
        }
    }
    
    static func request<T: Codable>(type: RequestType, params: [String: Any]) -> AnyPublisher<T, Error> {
        
        let url = type.base.appendinQueryParameters(params)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(T.self, from: $0.data)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func nextPokemonPage(offset: Int?, limit: Int? = 20) -> AnyPublisher<PokemonList, Error> {
        
        var params = [String: Any]()
        params["offset"] = offset
        params["limit"] = limit
        
        return API.request(type: .pokemon, params: params)
    }
    
    static func nextCardsPage(page: Int?, pageSize: Int? = 20) -> AnyPublisher<CardsList, Error> {
        
        var params = [String: Any]()
        params["page"] = page
        params["pageSize"] = pageSize
        
        return API.request(type: .card, params: params)
    }
}
