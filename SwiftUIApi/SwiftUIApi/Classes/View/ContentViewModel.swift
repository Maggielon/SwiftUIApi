//
//  ContentViewModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine
import NetworkModule

final class ContentViewModel: ObservableObject {
    
    struct State {
        var pokemons: [PokemonItem] = []
        var cards: [Card] = []
        var offset: Int = 0
        var limit: Int = 20
        var cardPage: Int = 1
        var canLoadNextPage = true
        var canLoadCardNextPage = true
    }
    
    @Published private(set) var state = State()
    
    @Published var selected: Int = 0
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: Pokemons
    
    func fetchPokemons() {
        PokemonAPI.getPokemonList(limit: state.limit, offset: state.offset, completion: onReceive)
    }
    
    private func onReceive(_ list: PokemonList?, _ error: Error?) {
        if let list = list {
            state.pokemons += list.results ?? []
            state.offset += state.limit
            state.canLoadNextPage = true
        } else if error != nil {
            state.canLoadNextPage = false
        }
    }
    
    // MARK: Cards
    
    func fetchCards() {
        CardsAPI.getAllCards(page: state.cardPage, pageSize: state.limit, completion: onReceiveCard)
    }
    
    private func onReceiveCard(_ list: CardsList?, _ error: Error?) {
        if let list = list {
            state.cards += list.cards ?? []
            state.cardPage += 1
            state.canLoadCardNextPage = true
        } else if error != nil {
            state.canLoadCardNextPage = false
        }
    }
}
