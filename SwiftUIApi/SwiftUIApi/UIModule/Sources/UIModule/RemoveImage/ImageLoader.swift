//
//  ImageLoader.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import UIKit
import Combine

public class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    public init(url: URL?, placeholderImage: UIImage? = UIImage(color: .lightGray)) {
        guard let url = url else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: placeholderImage)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}
