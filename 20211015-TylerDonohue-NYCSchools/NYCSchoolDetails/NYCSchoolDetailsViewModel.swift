//
//  NYCSchoolDetailsViewModel.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/18/21.
//

import Foundation

class NYCSchoolDetailsViewModel {
    
    private var apiService = ApiService()
    private var nycSchoolSAT = [NYCSchoolSAT]()
    
    func fetchNYCSchoolData(completion: @escaping () -> ()) {
        apiService.getNYCSchoolSAT { [weak self] (result) in
            switch result {
            case .success(let nycSchool):
                self?.nycSchoolSAT = nycSchool
                completion()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func accessSchoolDetails() -> NYCSchoolSAT {
        return nycSchoolSAT[0]
    }
    
}
