//
//  PokemonView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule
import UIModule

struct PokemonView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var name: String
    
    var body: some View {
        VStack {
            FakeNavBar(label: name)
            Spacer()
            List {
                if self.viewModel.pokemon != nil {
                    PokemonMainView(
                        pokemon: self.viewModel.pokemon,
                        destination: SpritesView(sprites: self.viewModel.pokemon?.sprites, name: self.name)
                    )
                    PokemonOtherView(pokemon: self.viewModel.pokemon)
                    
                } else {
                    Spinner(style: .large)
                        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                }
            }
        }.onAppear {
            self.viewModel.fetchPokemon(with: self.name)
        }
    }
}
