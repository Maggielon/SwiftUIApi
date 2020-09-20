//
//  ContentView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @ObservedObject var  viewModel = ContentViewModel()
    
    var body: some View {
        NavControllerView(transition: .custom(push: .slideIn, pop: .slideOut)) {
            VStack {
                FakeNavBar(label: "Pokemon")
                Picker(selection: self.$viewModel.selected, label: Text("Select")) {
                    Text("Cards").tag(0)
                    Text("Pokemons").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 15)
                List {
                    Section {
                        if self.viewModel.selected == 0 {
                            ForEach(self.viewModel.state.cards) { card in
                                CardCell(card: card)
                                    .onAppear() {
                                        if self.viewModel.state.cards.isLastItem(card) {
                                            self.viewModel.fetchCards()
                                        }
                                }
                            }
                        } else {
                            ForEach(self.viewModel.state.pokemons) { pokemon in
                                PokemonCell(pokemon: pokemon)
                                    .onAppear() {
                                        if self.viewModel.state.pokemons.isLastItem(pokemon) {
                                            self.viewModel.fetchPokemons()
                                        }
                                }
                            }
                        }
                    }
                    if self.viewModel.selected == 0 ? self.viewModel.state.canLoadCardNextPage : self.viewModel.state.canLoadNextPage {
                        Spinner(style: .medium)
                            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            self.viewModel.fetchCards()
            self.viewModel.fetchPokemons()
        }
    }
}
