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
    
    private let networkSerivice: INetworkService? = ServiceLocator.shared.getService(type: INetworkService.self)

    func fetchCard(with id: String) {
        networkSerivice?.get(type: .card, params: ["id": id], completion: onReceive)
    }
    
    private func onReceive(_ card: CardItem?, _ error: Error?) {
        if let card = card {
            self.card = card.card
        } else {
            self.card = nil
        }
    }
    
    func cardTypeString() -> String {
        self.card?.types?.compactMap { $0.rawValue }.joined(separator: ", ") ?? ""
    }
}
