//
//  CardView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        VStack {
            FakeNavBar(label: card.name ?? "Card")
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

extension Card: Identifiable { }
