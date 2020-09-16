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
        NavControllerView(transition: .custom(
            push: .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)),
            pop: .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
        )) {
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


struct PokemonCell: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        NavPushButton(destination: PokemonView(pokemon: pokemon)) {
            HStack {
                Text(self.pokemon.name.capitalized)
                .font(.system(size: 18, weight: .semibold))
                Spacer()
                Image(systemName: "chevron.right")
            }.contentShape(Rectangle())
        }
    }
}

struct CardCell: View {
    
    var card: Card
    
    var body: some View {
        NavPushButton(destination: CardView(card: card)) {
            HStack {
                RemoteImageView(imageLoader: ImageLoader(url: URL(string: self.card.imageURL ?? "")))
                Text(self.card.name ?? "")
                    .font(.system(size: 18, weight: .semibold))
            }.contentShape(Rectangle())
        }
    }
}


