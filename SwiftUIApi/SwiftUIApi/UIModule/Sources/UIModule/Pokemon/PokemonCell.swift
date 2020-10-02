//
//  PokemonCell.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct PokemonCell<Destination>: View where Destination: View {
    
    private let name: String
    private let destination: Destination
    
    public init(name: String, destination: Destination) {
        self.name = name
        self.destination = destination
    }
    
    public var body: some View {
        NavPushButton(destination: destination) {
            HStack {
                Text(self.name.capitalized)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }.contentShape(Rectangle())
        }
    }
}
