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
import CoreModule

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
    
    private let cardNS = ServiceLocator.shared.getService(type: ICardNetworkService.self)
    private let pokemonNS = ServiceLocator.shared.getService(type: IPokemonNetworkService.self)
    
    func fetchOnAppear() {
        self.resetState()
        self.fetchPokemons()
        self.fetchCards()
    }
    
    private func resetState() {
        self.state.pokemons = []
        self.state.cards = []
        self.state.offset = 0
        self.state.cardPage = 1
        self.state.canLoadNextPage = true
        self.state.canLoadCardNextPage = true
    }
    
    // MARK: Pokemons
    
    func fetchPokemons() {
        pokemonNS?.getList(limit: state.limit, offset: state.offset)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.state.canLoadNextPage = false
                }
            },
            receiveValue: { list in
                self.state.pokemons += list
                self.state.offset += self.state.limit
                self.state.canLoadNextPage = true
            }
        ).store(in: &subscriptions)
    }
    
    // MARK: Cards
    
    func fetchCards() {
        cardNS?.getCards(page: state.cardPage, size: state.limit)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.state.canLoadCardNextPage = false
                }
            },
            receiveValue: { list in
                self.state.cards += list
                self.state.cardPage += 1
                self.state.canLoadCardNextPage = true
            }
        ).store(in: &subscriptions)
    }
}
