//
//  ExtensionsModels.swift
//  
//
//  Created by Анастасия on 02.10.2020.
//

import Foundation

extension Attack: Identifiable {
    
    public var id: String {
        self.name ?? UUID().uuidString
    }
}

extension Card: Identifiable { }

extension Card {
    
    public var imageURL: URL {
        return URL(string: self.imageUrl ?? "") ?? URL(string: "https://pokemontcg.io/static/media/logo.a09cc1c3.png")!
    }
}
