//
//  CardTitleView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct CardTitleView: View {
    
    private let imageUrl: URL
    
    private let supertype: String?
    
    private let subtype: String?
    
    private let hp: String?
    
    private let types: String
    
    public init(imageUrl: URL?, supertype: String?, subtype: String?, hp: String?, types: String) {
        self.imageUrl = imageUrl ?? URL(string: "https://pokemontcg.io/static/media/logo.a09cc1c3.png")!
        self.supertype = supertype
        self.subtype = subtype
        self.hp = hp
        self.types = types
    }
    
    public var body: some View {
        VStack {
            RemoteImage(url: imageUrl)
            HStack {
                Text(supertype ?? "")
                    .foregroundColor(.gray)
                Text(subtype ?? "")
                    .foregroundColor(.gray)
                Text("HP \(hp ?? "")")
                    .font(.system(size: 14, weight: .light))
            }
            Text(types)
        }
    }
}
