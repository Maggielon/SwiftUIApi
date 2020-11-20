//
//  PokemonMainView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct PokemonMainView<Destination>: View where Destination: View {
    
    private let pokemon: Pokemon?
    private let destination: Destination
    
    public init(pokemon: Pokemon?, destination: Destination) {
        self.pokemon = pokemon
        self.destination = destination
    }
    
    public var body: some View {
        Section {
            SpritesItemView(
                name: self.pokemon?.sprites?.name,
                destination: destination
            )
            ItemView(title: "Id", value: self.pokemon?.id.value?.description)
            ItemView(title: "Ability: ", value: self.pokemon?.abilities.compactMap( { $0.ability?.name }).joined(separator: ", "))
            ItemView(title: "Base experience", value: self.pokemon?.baseExperience.value?.description)
            ItemView(title: "Forms: ", value: self.pokemon?.forms.compactMap( { $0.name }).joined(separator: ", "))
            ItemView(title: "Game Indices: ", value: self.pokemon?.gameIndices.compactMap { $0.infoText }.joined(separator: ", "))
        }
    }
}
