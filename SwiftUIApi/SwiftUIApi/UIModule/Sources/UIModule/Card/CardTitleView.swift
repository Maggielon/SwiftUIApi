//
//  CardTitleView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct CardTitleView: View {
    
    private let imageUrl: String?
    
    private let supertype: String?
    
    private let subtype: String?
    
    private let hp: String?
    
    private let types: String
    
    public init(imageUrl: String?, supertype: String?, subtype: String?, hp: String?, types: String) {
        self.imageUrl = imageUrl
        self.supertype = supertype
        self.subtype = subtype
        self.hp = hp
        self.types = types
    }
    
    public var body: some View {
        VStack {
            RemoteImageView(imageLoader: ImageLoader(url: URL(string: imageUrl ?? "")))
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

struct CardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CardTitleView(imageUrl: "www.any.com", supertype: "supertype", subtype: "subtype",  hp: "100", types: "type1, type2")
    }
}
