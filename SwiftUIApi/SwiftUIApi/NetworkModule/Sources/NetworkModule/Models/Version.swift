//
// Version.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import RealmSwift

public class Version: RealmSwift.Object, Codable {

    @objc dynamic public var name: String?

    public convenience init(name: String?) {
        self.init()
        
        self.name = name
    }
}
