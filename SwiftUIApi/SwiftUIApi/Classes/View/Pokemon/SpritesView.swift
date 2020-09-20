//
//  SpritesView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

struct SpritesView: View {
    
    var sprites: PokemonSprites?
    
    var name: String = ""
    
    var body: some View {
        VStack {
            FakeNavBar(label: name + " sprites")
            NavPopButton(destination: .root) {
                Text("Turn to root")
                    .foregroundColor(.blue)
            }
            VStack {
                HStack {
                    RemoteImageView(imageLoader: ImageLoader(url: URL(string: sprites?.backDefault ?? "")))
                    RemoteImageView(imageLoader: ImageLoader(url: URL(string: sprites?.frontDefault ?? "")))
                }
                HStack {
                    RemoteImageView(imageLoader: ImageLoader(url: URL(string: sprites?.backShiny ?? "")))
                    RemoteImageView(imageLoader: ImageLoader(url: URL(string: sprites?.frontShiny ?? "")))
                }
            }
            Spacer()
        }
    }
}
