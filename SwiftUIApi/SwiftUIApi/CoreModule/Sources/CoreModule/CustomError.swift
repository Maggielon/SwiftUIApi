//
//  CustomError.swift
//  
//
//  Created by Анастасия on 04.10.2020.
//

import Foundation

enum CustomError: Error {
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .unknown: return "Unknown error"
        }
    }
}
