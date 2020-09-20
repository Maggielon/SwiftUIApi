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

final class CardViewModel: ObservableObject {

    @Published private(set) var card: Card?
    
    private var subscriptions = Set<AnyCancellable>()

    func fetchCard(with id: String) {
        CardsIdAPI.getCardById(id: id, completion: onReceive)
    }
    
    private func onReceive(_ card: CardItem?, _ error: Error?) {
        if let card = card {
            self.card = card.card
        } else {
            self.card = nil
        }
    }
}

extension Card: Identifiable { }

extension Attack: Identifiable {
    
    public var id: String {
        self.name ?? UUID().uuidString
    }
}
