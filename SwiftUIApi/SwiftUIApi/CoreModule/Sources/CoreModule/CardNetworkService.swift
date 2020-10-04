//
//  CardNetworkService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import NetworkModule
import Combine

public protocol ICardNetworkService {
    func getCards(page: Int, size: Int) -> AnyPublisher<CardsList, Error>
    func getCard(id: String) -> AnyPublisher<CardItem, Error>
}

public class CardNetworkService: ICardNetworkService {
    
    private let cache: ICache?
    
    public init(cache: ICache?) {
        self.cache = cache
    }
    
    public func getCards(page: Int, size: Int) -> AnyPublisher<CardsList, Error> {
        let cacheKey = "CardNetworkService.getCards.page\(page).size\(size)"
        if let list: CardsList = self.cache?[cacheKey] {
            return Result.Publisher(list).eraseToAnyPublisher()
        }
        return Future { observer in
            CardsAPI.getAllCards(page: page, pageSize: size) { list, error in
                if let error = error {
                    observer(.failure(error))
                } else if let list = list {
                    observer(.success(list))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
        }
        .handleEvents(receiveOutput: { list in
            self.cache?.set(list, forKey: cacheKey, expireAfter: .never)
        })
        .eraseToAnyPublisher()
    }
    
    public func getCard(id: String) -> AnyPublisher<CardItem, Error> {
        let cacheKey = "CardNetworkService.getCard.id\(id)"
        if let list: CardItem = self.cache?[cacheKey] {
            return Result.Publisher(list).eraseToAnyPublisher()
        }
        return Future { observer in
            CardsIdAPI.getCardById(id: id) { list, error in
                if let error = error {
                    observer(.failure(error))
                } else if let list = list {
                    observer(.success(list))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
        }
        .handleEvents(receiveOutput: { item in
            self.cache?.set(item, forKey: cacheKey, expireAfter: .never)
        })
        .eraseToAnyPublisher()
    }
}
