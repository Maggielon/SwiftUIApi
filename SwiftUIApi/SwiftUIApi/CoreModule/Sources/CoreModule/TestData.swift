//
//  TestData.swift
//  
//
//  Created by Анастасия on 30.11.2020.
//

import Foundation

public class TestData: Codable {
    
    public var tab: Int = 0
    
    public var cardId: String?
    
    public var pokemonName: String?
    
    public init(tab: Int = 0, cardId: String? = nil, pokemonName: String? = nil) {
        self.tab = tab
        self.cardId = cardId
        self.pokemonName = pokemonName
    }
}
