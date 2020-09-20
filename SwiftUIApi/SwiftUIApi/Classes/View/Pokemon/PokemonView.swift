//
//  PokemonView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

struct PokemonView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var item: PokemonItem
    
    var body: some View {
        VStack {
            FakeNavBar(label: item.name ?? "")
            Spacer()
            List {
                if self.viewModel.pokemon != nil {
                    Section {
                        sprites(pokemon: self.viewModel.pokemon)
                        item(title: "Id", value: self.viewModel.pokemon?.id?.description)
                        item(title: "Ability: ", value: self.viewModel.pokemon?.abilities?.compactMap( { $0.ability?.name }).joined(separator: ", "))
                        item(title: "Base experience", value: self.viewModel.pokemon?.baseExperience?.description)
                        item(title: "Forms: ", value: self.viewModel.pokemon?.forms?.compactMap( { $0.name }).joined(separator: ", "))
                        item(title: "Game Indices: ", value: self.viewModel.pokemon?.gameIndices?.compactMap { ($0.gameIndex?.description ?? "") + " ver: " + ($0.version?.name ?? "") }.joined(separator: ", "))
                    }
                    Section {
                        item(title: "Height", value: self.viewModel.pokemon?.height?.description)
                        item(title: "Weight", value: self.viewModel.pokemon?.weight?.description)
                        item(title: "Moves: ", value: self.viewModel.pokemon?.moves?.compactMap( { $0.move?.name }).joined(separator: ", "))
                        item(title: "Species: ", value: self.viewModel.pokemon?.species?.name)
                    }
                } else {
                    Spinner(style: .large)
                        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                }
            }
        }.onAppear {
            if let name = self.item.name {
                self.viewModel.fetchPokemon(with: name)
            }
        }
    }
    
    func sprites(pokemon: Pokemon?) -> some View {
        NavPushButton(destination: SpritesView(sprites: pokemon?.sprites, name: self.item.name ?? "")) {
            HStack {
                self.item(title: "Sprites: ", value: pokemon?.sprites?.name)
                Spacer()
                Text("Show")
                    .foregroundColor(.blue)
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
        }
    }
    
    func item(title: String, value: String?) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "-")
                .font(.system(size: 18, weight: .regular))
        }
    }
}
