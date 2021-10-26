//
//  NYCSchoolViewModel.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/17/21.
//

import Foundation

class NYCSchoolViewModel {
    
    private var apiService = ApiService()
    private var nycSchools = [NYCSchools]()
    
    func fetchNYCSchoolsData(completion: @escaping () -> ()) {
        apiService.getNYCSchools { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.nycSchools = listOf.sorted { $0.schoolName < $1.schoolName }
                completion()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return nycSchools.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> NYCSchools {
        return nycSchools[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) -> String {
        return nycSchools[indexPath.row].schoolID
    }
    
    
    
}
