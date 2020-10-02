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
