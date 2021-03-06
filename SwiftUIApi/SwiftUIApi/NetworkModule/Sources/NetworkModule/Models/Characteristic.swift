//
// Characteristic.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Characteristic: Codable { 


    public var id: Int?
    public var geneModulo: Int?
    public var possibleValues: [Int]?

    public init(id: Int?, geneModulo: Int?, possibleValues: [Int]?) {
        self.id = id
        self.geneModulo = geneModulo
        self.possibleValues = possibleValues
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case id
        case geneModulo = "gene_modulo"
        case possibleValues = "possible_values"
    }

}
