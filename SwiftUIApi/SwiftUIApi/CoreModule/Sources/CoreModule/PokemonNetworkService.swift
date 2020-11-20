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
import RealmSwift

public protocol IPokemonNetworkService {
    func getList(limit: Int, offset: Int) -> AnyPublisher<[PokemonItem], Error>
    func getPokemon(by name: String) -> AnyPublisher<Pokemon, Error>
}

public class PokemonNetworkService: IPokemonNetworkService {
    
    private let mainService: IMainService?
    
    public init(mainService: IMainService?) {
        self.mainService = mainService
    }
    
    public func getList(limit: Int, offset: Int) -> AnyPublisher<[PokemonItem], Error> {
        var offsets: [Int] = (UserDefaults.standard.array(forKey: "pokemonOffset") as? [Int]) ?? []
        if offsets.contains(offset) {
            return Future { observer in
                if let list: Results<PokemonItem> = self.mainService?.read() {
                    let array = Array(list)[offset..<(offset + limit)]
                    observer(.success(Array(array)))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }.eraseToAnyPublisher()
        }
        return Future { observer in
            let group = DispatchGroup()
            group.enter()
            PokemonAPI.getPokemonList(limit: limit, offset: offset) { list, error in
                if let error = error {
                    observer(.failure(error))
                    group.leave()
                } else if let results = list?.results {
                    offsets.append(offset)
                    UserDefaults.standard.set(offsets, forKey: "pokemonOffset")
                    self.mainService?.write(data: results)
                    _ = group.wait(timeout: .now() + 1)
                    group.leave()
                } else {
                    observer(.failure(CustomError.unknown))
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                if let list: Results<PokemonItem> = self.mainService?.read(), !list.isEmpty {
                    observer(.success(Array(list)))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
            
        }
        .eraseToAnyPublisher()
    }
    
    public func getPokemon(by name: String) -> AnyPublisher<Pokemon, Error> {
        if let pokemon: Pokemon = self.mainService?.read(with: name) {
            return Result.Publisher(pokemon).eraseToAnyPublisher()
        }
        return Future { observer in
            let group = DispatchGroup()
            group.enter()
            PokemonNameAPI.getPokemonByName(name: name) { pokemon, error in
                if let error = error {
                    observer(.failure(error))
                    group.leave()
                } else if let pokemon = pokemon {
                    self.mainService?.write(data: pokemon)
                    _ = group.wait(timeout: .now() + 1)
                    group.leave()
                } else {
                    observer(.failure(CustomError.unknown))
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                if let pokemon: Pokemon = self.mainService?.read(with: name) {
                    observer(.success(pokemon))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
            
        }
        .eraseToAnyPublisher()
    }
}
