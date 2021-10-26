//
//  NYCSchoolSAT.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/15/21.
//

import Foundation

struct NYCSchoolSATResponse: Codable {
    var nycSchoolsSAT: [NYCSchoolSAT]
}

struct NYCSchoolSAT: Codable {
    var schoolID: String
    var schoolName: String
    var numberOfSATTakers: String
    var readingSATAverage: String
    var mathSATAverage: String
    var writingSATAverage: String
    
    private enum CodingKeys: String, CodingKey {
        case schoolID = "dbn"
        case schoolName = "school_name"
        case numberOfSATTakers = "num_of_sat_test_takers"
        case readingSATAverage = "sat_critical_reading_avg_score"
        case mathSATAverage = "sat_math_avg_score"
        case writingSATAverage = "sat_writing_avg_score"
    }
    
}
