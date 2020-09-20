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

final class PokemonViewModel: ObservableObject {

    @Published private(set) var pokemon: Pokemon?
    
    private var subscriptions = Set<AnyCancellable>()

    func fetchPokemon(with name: String) {
        PokemonNameAPI.getPokemonByName(name: name, completion: onReceive)
    }
    
    private func onReceive(_ pokemon: Pokemon?, _ error: Error?) {
        if let pokemon = pokemon {
            self.pokemon = pokemon
        } else {
            self.pokemon = nil
        }
    }
}
