//
//  PokemonCell.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

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
