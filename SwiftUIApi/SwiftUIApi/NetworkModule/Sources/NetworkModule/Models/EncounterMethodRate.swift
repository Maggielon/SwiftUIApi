//
// EncounterMethodRate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct EncounterMethodRate: Codable { 


    public var encounterMethod: EncounterMethod?
    public var versionDetails: [EncounterVersionDetails]?

    public init(encounterMethod: EncounterMethod?, versionDetails: [EncounterVersionDetails]?) {
        self.encounterMethod = encounterMethod
        self.versionDetails = versionDetails
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }

}
