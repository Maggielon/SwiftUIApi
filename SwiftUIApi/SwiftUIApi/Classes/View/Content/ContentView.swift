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


struct PokemonCell: View {
    
    var pokemon: PokemonItem
    
    var body: some View {
        NavPushButton(destination: PokemonView(item: pokemon)) {
            HStack {
                Text(self.pokemon.name?.capitalized ?? "")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }.contentShape(Rectangle())
        }
    }
}

struct CardCell: View {
    
    var card: Card
    
    var body: some View {
        NavPushButton(destination: CardView(id: card.id ?? "")) {
            HStack {
                RemoteImageView(imageLoader: ImageLoader(url: URL(string: self.card.imageUrl ?? "")))
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.card.name ?? "")
                            .font(.system(size: 18, weight: .semibold))
                        Text(self.card.nationalPokedexNumber != nil ? "(\(self.card.nationalPokedexNumber?.description ?? ""))" : "")
                            .font(.system(size: 12, weight: .light))
                    }
                    self.detail(title: "Type: ", value: self.card.types?.compactMap { $0.rawValue }.joined(separator: ", "))
                    self.detail(title: "Subtype: ", value: self.card.subtype?.rawValue)
                    self.detail(title: "Supertype: ", value: self.card.supertype?.rawValue)
                    self.detail(title: "Series: ", value: self.card.series)
                    self.detail(title: "Set: ", value: self.card.setValue)
                    self.detail(title: "HP: ", value: self.card.hp)
                    self.detail(title: "Attacks: ", value: "\(self.card.attacks?.count ?? 0)")
                    self.detail(title: "Weaknesses: ", value: "\(self.card.weaknesses?.count ?? 0)")
                    Spacer()
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }.contentShape(Rectangle())
        }
    }
    
    func detail(title: String, value: String?) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "-")
                .font(.system(size: 14, weight: .regular))
        }
    }
}


