//
//  CardView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "Card"))
    }
}