//
// VerboseEffect.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct VerboseEffect: Codable { 


    public var effect: String?
    public var shortEffect: String?
    public var language: Language?

    public init(effect: String?, shortEffect: String?, language: Language?) {
        self.effect = effect
        self.shortEffect = shortEffect
        self.language = language
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case effect
        case shortEffect = "short_effect"
        case language
    }

}
