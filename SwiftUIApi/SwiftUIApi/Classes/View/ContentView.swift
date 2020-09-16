//
//  ContentView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @ObservedObject var  viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $viewModel.selected, label: Text("Select")) {
                    Text("Pokemon").tag(0)
                    Text("Cards").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 15)
                List {
                    Section {
                        if viewModel.selected == 0 {
                            ForEach(viewModel.state.pokemons) { pokemon in
                                PokemonCell(pokemon: pokemon)
                                    .onAppear() {
                                        if self.viewModel.state.pokemons.isLastItem(pokemon) {
                                            self.viewModel.fetchPokemons()
                                        }
                                }
                            }
                        } else {
                            ForEach(viewModel.state.cards) { card in
                                CardCell(card: card)
                                    .onAppear() {
                                        if self.viewModel.state.cards.isLastItem(card) {
                                            self.viewModel.fetchCards()
                                        }
                                }
                            }
                        }
                    }
                    if viewModel.selected == 0 ? viewModel.state.canLoadNextPage : viewModel.state.canLoadCardNextPage {
                        Spinner(style: .medium)
                            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                    }
                }
            }.navigationBarTitle(Text("Pokemon"))
        }.edgesIgnoringSafeArea(.bottom)
            .onAppear() {
                self.viewModel.fetchPokemons()
                self.viewModel.fetchCards()
        }
    }
}


struct PokemonCell: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        NavigationLink(destination: PokemonView(pokemon: pokemon)) {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 18, weight: .semibold))
            }
        }
    }
}

struct CardCell: View {
    
    var card: Card
    
    var body: some View {
        NavigationLink(destination: CardView(card: card)) {
            HStack {
                RemoteImageView(imageLoader: ImageLoader(url: URL(string: card.imageURL ?? "")))
                Text(card.name ?? "")
                    .font(.system(size: 18, weight: .semibold))
            }
        }
    }
}


