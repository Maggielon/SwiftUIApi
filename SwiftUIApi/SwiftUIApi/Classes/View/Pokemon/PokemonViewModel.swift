//
//  PokemonViewModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine
import NetworkModule
import CoreModule

final class PokemonViewModel: ObservableObject {

    @Published private(set) var pokemon: Pokemon?
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let networkSerivice = ServiceLocator.shared.getService(type: IPokemonNetworkService.self)

    func fetchPokemon(with name: String) {
        networkSerivice?.getPokemon(by: name)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.pokemon = nil
                }
            },
            receiveValue: { pokemon in
                self.pokemon = pokemon
            }
        ).store(in: &subscriptions)
    }
}
