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
    
    @ObservedObject var viewModel = CardViewModel()
    
    var id: String
    
    var body: some View {
        VStack {
            FakeNavBar(label: self.viewModel.card?.name ?? "Card")
            if self.viewModel.card != nil {
                VStack {
                    RemoteImageView(imageLoader: ImageLoader(url: URL(string: self.viewModel.card?.imageUrl ?? "")))
                    HStack {
                        Text(self.viewModel.card?.supertype?.rawValue ?? "")
                            .foregroundColor(.gray)
                        Text(self.viewModel.card?.subtype?.rawValue ?? "")
                            .foregroundColor(.gray)
                        Text("HP \(self.viewModel.card?.hp ?? "")")
                            .font(.system(size: 14, weight: .light))
                        
                    }
                    Text(self.viewModel.card?.types?.compactMap { $0.rawValue}.joined(separator: ", ") ?? "")
                    ForEach(self.viewModel.card?.attacks ?? []) { attack in
                        VStack {
                            HStack {
                                Text(attack.name ?? "")
                                    .font(.system(size: 16, weight: .regular))
                                Divider()
                                Text(attack.damage ?? "")
                                    .font(.system(size: 16, weight: .regular))
                            }.frame(height: 30)
                            Text(attack.text ?? "")
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .font(.system(size: 14, weight: .light))
                        }
                    }
                    HStack {
                        detail(name: "weakness", value: self.viewModel.card?.weaknesses?.compactMap { "\($0.type ?? "") \($0.value ?? "")" }.joined(separator: ", "))
                        detail(name: "resistance", value: self.viewModel.card?.resistances?.compactMap { "\($0.type ?? "") \($0.value ?? "")" }.joined(separator: ", "))
                        detail(name: "retreat cost", value: self.viewModel.card?.retreatCost?.joined(separator: ", "))
                    }.padding(.vertical, 20)
                    HStack {
                        detail(name: "artist", value: self.viewModel.card?.artist)
                        detail(name: "rarity", value: self.viewModel.card?.rarity)
                        detail(name: "set", value: self.viewModel.card?.setValue)
                    }
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
    
    func detail(name: String, value: String?) -> some View {
        VStack {
            Text(name.uppercased())
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "N/A")
                .font(.system(size: 16, weight: .regular))
        }
    }
}
