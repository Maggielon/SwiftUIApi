//
//  PokemonView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct PokemonView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            FakeNavBar(label: pokemon.name)
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon(name: "pokemon", url: "url"))
    }
}
