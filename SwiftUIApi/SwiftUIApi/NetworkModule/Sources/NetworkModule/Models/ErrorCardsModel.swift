//
// ErrorCardsModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct ErrorCardsModel: Codable { 


    public var status: Int?
    public var error: String?

    public init(status: Int?, error: String?) {
        self.status = status
        self.error = error
    }

}
