//
//  CardCell.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct CardCell<Destination>: View where Destination: View {
    
    private let card: Card
    private let destination: Destination
    
    public init(card: Card, destination: Destination) {
        self.card = card
        self.destination = destination
    }
    
    public var body: some View {
        NavPushButton(destination: destination) {
            HStack {
                RemoteImage(url: self.card.imageURL)
                VStack(alignment: .leading) {
                    HStack {
                        Text(self.card.name ?? "")
                            .font(.system(size: 18, weight: .semibold))
                        Text("(\(self.card.nationalPokedexNumber.value?.description ?? ""))")
                        .font(.system(size: 12, weight: .light))
                    }
                    self.detail(title: "Type: ", value: self.card.types.compactMap { $0 }.joined(separator: ", "))
                    self.detail(title: "Subtype: ", value: self.card.subtype)
                    self.detail(title: "Supertype: ", value: self.card.supertype)
                    self.detail(title: "Series: ", value: self.card.series)
                    self.detail(title: "Set: ", value: self.card.setValue)
                    self.detail(title: "HP: ", value: self.card.hp)
                    self.detail(title: "Attacks: ", value: "\(self.card.attacks.count)")
                    self.detail(title: "Weaknesses: ", value: "\(self.card.weaknesses.count)")
                    Spacer()
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }.contentShape(Rectangle())
        }
    }
    
    private func detail(title: String, value: String?) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "-")
                .font(.system(size: 14, weight: .regular))
        }
    }
}


