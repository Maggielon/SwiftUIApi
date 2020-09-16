//
//  ContentViewModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    
    struct State {
        var pokemons: [Pokemon] = []
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
        API.nextPokemonPage(offset: state.offset, limit: state.limit)
        .sink(receiveCompletion: onReceive,
              receiveValue: onReceive)
        .store(in: &subscriptions)
    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: break
        case .failure: state.canLoadNextPage = false
        }
    }
    
    private func onReceive(_ posts: PokemonList) {
        state.pokemons += posts.results ?? []
        state.offset += state.limit
        state.canLoadNextPage = true
    }
    
    // MARK: Cards
    
    func fetchCards() {
        API.nextCardsPage(page: state.cardPage, pageSize: state.limit)
        .sink(receiveCompletion: onReceiveCard,
              receiveValue: onReceiveCard)
        .store(in: &subscriptions)
    }
    
    private func onReceiveCard(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished: break
        case .failure: state.canLoadCardNextPage = false
        }
    }
    
    private func onReceiveCard(_ posts: PokemonCardList) {
        state.cards += posts.cards ?? []
        state.cardPage += 1
        state.canLoadCardNextPage = true
    }
}
