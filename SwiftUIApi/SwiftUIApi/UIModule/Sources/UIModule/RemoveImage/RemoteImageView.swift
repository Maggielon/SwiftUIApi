//
//  RemoteImageView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct RemoteImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    public init(imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
    }
    
    public var body: some View {
        Image(uiImage: self.imageLoader.image ?? UIImage(color: .lightGray)!)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 200)
    }
}
