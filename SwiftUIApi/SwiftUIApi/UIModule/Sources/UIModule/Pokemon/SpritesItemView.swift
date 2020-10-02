//
//  SpritesItemView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct SpritesItemView<Destination>: View where Destination: View {
    
    private let name: String?
    private let destination: Destination
    
    public init(name: String?, destination: Destination) {
        self.name = name
        self.destination = destination
    }
    
    public var body: some View {
        NavPushButton(destination: destination) {
            HStack {
                ItemView(title: "Sprites: ", value: self.name)
                Spacer()
                Text("Show")
                    .foregroundColor(.blue)
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
        }
    }
}
