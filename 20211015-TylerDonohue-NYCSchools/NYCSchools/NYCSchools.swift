//
//  NYSCchools.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/15/21.
//

import Foundation

struct NYCSchoolsResponse: Codable {
    var nycSchool: [NYCSchools]
    
    private enum CodingKeys: String, CodingKey {
        case nycSchool = ""
    }
    
}

struct NYCSchools: Codable {
    var schoolID: String
    var schoolName: String
    var schoolIntro: String
    
    private enum CodingKeys: String, CodingKey {
        case schoolID = "dbn"
        case schoolName = "school_name"
        case schoolIntro = "overview_paragraph"
    }
    
}

