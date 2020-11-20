//
//  PokemonOtherView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct PokemonOtherView: View {
    
    private let pokemon: Pokemon?
    
    public init(pokemon: Pokemon?) {
        self.pokemon = pokemon
    }
    
    public var body: some View {
        Section {
            ItemView(title: "Height", value: self.pokemon?.height.value?.description)
            ItemView(title: "Weight", value: self.pokemon?.weight.value?.description)
            ItemView(title: "Moves: ", value: self.pokemon?.moves.compactMap( { $0.move?.name }).joined(separator: ", "))
            ItemView(title: "Species: ", value: self.pokemon?.species?.name)
        }
    }
}
