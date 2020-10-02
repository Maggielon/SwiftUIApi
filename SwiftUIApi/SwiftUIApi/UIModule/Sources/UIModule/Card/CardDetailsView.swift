//
//  CardDetailsView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct CardDetailsView: View {
    
    private let artist: String?
    
    private let rarity: String?
    
    private let setValue: String?
    
    private let weaknesses: [Weakness]?
    
    private let resistances: [Resistance]?
    
    private let retreatCost: [String]?
    
    public init(artist: String?, rarity: String?, setValue: String?, weaknesses: [Weakness]?, resistances: [Resistance]?, retreatCost: [String]?) {
        self.artist = artist
        self.rarity = rarity
        self.setValue = setValue
        self.weaknesses = weaknesses
        self.resistances = resistances
        self.retreatCost = retreatCost
    }

    public var body: some View {
        VStack {
            HStack {
                detail(name: "weakness", value: weaknesses?.compactMap { "\($0.type ?? "") \($0.value ?? "")" }.joined(separator: ", "))
                detail(name: "resistance", value: resistances?.compactMap { "\($0.type ?? "") \($0.value ?? "")" }.joined(separator: ", "))
                detail(name: "retreat cost", value: retreatCost?.joined(separator: ", "))
            }.padding(.vertical, 20)
            HStack {
                detail(name: "artist", value: artist)
                detail(name: "rarity", value: rarity)
                detail(name: "set", value: setValue)
            }
        }
    }
    
    private func detail(name: String, value: String?) -> some View {
        VStack {
            Text(name.uppercased())
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "N/A")
                .font(.system(size: 16, weight: .regular))
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(artist: "artist", rarity: "rarity", setValue: "set", weaknesses: [], resistances: [], retreatCost: [])
    }
}
