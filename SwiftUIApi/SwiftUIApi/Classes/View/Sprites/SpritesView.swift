//
//  SpritesView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule
import UIModule

struct SpritesView: View {
    
    var sprites: PokemonSprites?
    
    var name: String = ""
    
    var defaultURL: URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png")!
    
    var body: some View {
        VStack {
            FakeNavBar(label: name + " sprites")
            NavPopButton(destination: .root) {
                Text("Turn to root")
                    .foregroundColor(.blue)
            }
            VStack {
                HStack {
                    RemoteImage(url: URL(string: sprites?.backDefault ?? "") ?? self.defaultURL)
                    RemoteImage(url: URL(string: sprites?.frontDefault ?? "") ?? self.defaultURL)
                }
                HStack {
                    RemoteImage(url: URL(string: sprites?.backShiny ?? "") ?? self.defaultURL)
                    RemoteImage(url: URL(string: sprites?.frontShiny ?? "") ?? self.defaultURL)
                }
            }
            Spacer()
        }
    }
}

extension PokemonItem: Identifiable {
    
    public var id: String {
        return self.name ?? UUID().uuidString
    }
}
