//
//  CardViewModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 20.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import Combine
import NetworkModule
import CoreModule

final class CardViewModel: ObservableObject {

    @Published private(set) var card: Card?
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let networkSerivice = ServiceLocator.shared.getService(type: ICardNetworkService.self)

    func fetchCard(with id: String) {
        networkSerivice?.getCard(id: id)
        .sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.card = nil
                }
            },
            receiveValue: { card in
                self.card = card
            }
        ).store(in: &subscriptions)
    }
    
    func cardTypeString() -> String {
        self.card?.types?.compactMap { $0 }.joined(separator: ", ") ?? ""
    }
}
