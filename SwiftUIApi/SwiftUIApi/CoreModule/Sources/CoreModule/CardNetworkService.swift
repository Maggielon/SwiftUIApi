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
import RealmSwift

public protocol ICardNetworkService {
    func getCards(page: Int, size: Int) -> AnyPublisher<[Card], Error>
    func getCard(id: String) -> AnyPublisher<Card?, Error>
}

public class CardNetworkService: ICardNetworkService {
    
    private let mainService: IMainService?
    
    public init(mainService: IMainService?) {
        self.mainService = mainService
    }
    
    public func getCards(page: Int, size: Int) -> AnyPublisher<[Card], Error> {
        var pages: [Int] = (UserDefaults.standard.array(forKey: "pages") as? [Int]) ?? []
        if pages.contains(page) {
            return Future { observer in
                if let list: Results<Card> = self.mainService?.read(), !list.isEmpty {
                    let array = Array(list)[(page - 1) * size..<page * size]
                    observer(.success(Array(array)))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }.eraseToAnyPublisher()
        }
        return Future { observer in
            let group = DispatchGroup()
            group.enter()
            CardsAPI.getAllCards(page: page, pageSize: size) { list, error in
                if let error = error {
                    observer(.failure(error))
                    group.leave()
                } else if let cards = list?.cards {
                    pages.append(page)
                    UserDefaults.standard.set(pages, forKey: "pages")
                    self.mainService?.write(data: cards)
                    _ = group.wait(timeout: .now() + 1)
                    group.leave()
                } else {
                    observer(.failure(CustomError.unknown))
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                if let list: Results<Card> = self.mainService?.read(), !list.isEmpty {
                    observer(.success(Array(list)))
                } else {
                    observer(.failure(CustomError.unknown))
                }
            }
            
        }
        .eraseToAnyPublisher()
    }
    
    public func getCard(id: String) -> AnyPublisher<Card?, Error> {
        let card: Card? = self.mainService?.read(with: id)
        return Result.Publisher(card).eraseToAnyPublisher()
    }
}
