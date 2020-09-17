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
    
    var item: PokemonItem
    
    var body: some View {
        VStack {
            FakeNavBar(label: item.name ?? "")
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

extension PokemonItem: Identifiable {
    
    public var id: String {
        return self.name ?? ""
    }
}
