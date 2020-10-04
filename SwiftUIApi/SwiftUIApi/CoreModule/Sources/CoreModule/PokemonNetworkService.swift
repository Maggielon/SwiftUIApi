//
//  PokemonNetworkService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import NetworkModule
import Combine

public protocol IPokemonNetworkService {
    func getList(limit: Int, offset: Int) -> AnyPublisher<PokemonList, Error>
    func getPokemon(by name: String) -> AnyPublisher<Pokemon, Error>
}

public class PokemonNetworkService: IPokemonNetworkService {
    
    private let cache: ICache?
    
    public init(cache: ICache?) {
        self.cache = cache
    }
    
    public func getList(limit: Int, offset: Int) -> AnyPublisher<PokemonList, Error> {
        let cacheKey = "PokemonNetworkService.getList.limit\(limit).offset\(offset)"
        if let list: PokemonList = self.cache?[cacheKey] {
            return Result.Publisher(list).eraseToAnyPublisher()
        }
        return Future { observer in
            PokemonAPI.getPokemonList(limit: limit, offset: offset) { list, error in
                if let error = error {
                    observer(.failure(error))
                } else if let list = list {
                    observer(.success(list))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
        }
        .handleEvents(receiveOutput: { list in
            self.cache?.set(list, forKey: cacheKey, expireAfter: .never)
        })
        .eraseToAnyPublisher()
    }
    
    public func getPokemon(by name: String) -> AnyPublisher<Pokemon, Error> {
        let cacheKey = "PokemonNetworkService.getPokemon.name\(name)"
        if let pokemon: Pokemon = self.cache?[cacheKey] {
            return Result.Publisher(pokemon).eraseToAnyPublisher()
        }
        return Future { observer in
            PokemonNameAPI.getPokemonByName(name: name) { pokemon, error in
                if let error = error {
                    observer(.failure(error))
                } else if let pokemon = pokemon {
                    observer(.success(pokemon))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
        }
        .handleEvents(receiveOutput: { pokemon in
            self.cache?.set(pokemon, forKey: cacheKey, expireAfter: .never)
        })
        .eraseToAnyPublisher()
    }
}
