//
//  RemoteImage.swift
//  SwiftUIApi
//
//  Created by Анастасия on 04.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import URLImage

public struct RemoteImage: View {
    
    private let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public var body: some View {
        URLImage(url, placeholder: { _ in
            Rectangle().foregroundColor(.gray)
            
        }) { proxy in
            proxy.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        }
        .frame(width: 150.0, height: 200.0)
    }
}
