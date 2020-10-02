//
//  CardView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule
import UIModule

struct CardView: View {
    
    @ObservedObject var viewModel = CardViewModel()
    
    var id: String
    
    var body: some View {
        VStack {
            FakeNavBar(label: self.viewModel.card?.name ?? "Card")
            if self.viewModel.card != nil {
                VStack {
                    CardTitleView(
                        imageUrl: self.viewModel.card?.imageUrl,
                        supertype: self.viewModel.card?.supertype?.rawValue,
                        subtype: self.viewModel.card?.subtype?.rawValue,
                        hp: self.viewModel.card?.hp,
                        types: self.viewModel.cardTypeString()
                    )
                    CardMainView(attacks: self.viewModel.card?.attacks ?? [])
                    CardDetailsView(
                        artist: self.viewModel.card?.artist,
                        rarity: self.viewModel.card?.rarity,
                        setValue: self.viewModel.card?.setValue,
                        weaknesses: self.viewModel.card?.weaknesses,
                        resistances: self.viewModel.card?.resistances,
                        retreatCost: self.viewModel.card?.retreatCost
                    )
                    
                }.padding(.horizontal, 20)
            } else {
                Spinner(style: .large)
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
            Spacer()
        }.onAppear {
            self.viewModel.fetchCard(with: self.id)
        }
    }
}
