//
// NatureStatAffectSets.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct NatureStatAffectSets: Codable { 


    public var increase: [Nature]?
    public var decrease: [Nature]?

    public init(increase: [Nature]?, decrease: [Nature]?) {
        self.increase = increase
        self.decrease = decrease
    }

}
