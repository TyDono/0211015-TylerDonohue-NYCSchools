//
//  ApiService.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/16/21.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getNYCSchools(completion: @escaping (Result<[NYCSchools], Error>) -> Void) {
        let nycSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: nycSchoolsURL) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("No Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonDataDecoded = try decoder.decode([NYCSchools].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonDataDecoded))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
    func getNYCSchoolSAT(completion: @escaping (Result<[NYCSchoolSAT], Error>) -> Void) {
        let nycSchoolURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(Constants.schoolDBN)"
        guard let url = URL(string: nycSchoolURL) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("No Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonDataDecoded = try decoder.decode([NYCSchoolSAT].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonDataDecoded))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
}
