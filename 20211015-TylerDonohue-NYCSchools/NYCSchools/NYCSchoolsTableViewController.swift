//
//  NYCSchoolsTableViewController.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/16/21.
//

import UIKit

class NYCSchoolsTableViewController: UITableViewController {
    
    var nycSchools = [NYCSchools]()
    let apiService = ApiService()
    private var nycSchoolViewModel = NYCSchoolViewModel()
    var nycSchoolName: String = ""
    var nycSchoolID: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNYCSchools()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nycSchoolViewModel.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NYCSchoolCell", for: indexPath) as? NYCSchoolTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.25
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        let nycSchool = nycSchoolViewModel.cellForRowAt(indexPath: indexPath)
        cell.NYCSchoolName.text = nycSchool.schoolName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nycSchool = nycSchoolViewModel.cellForRowAt(indexPath: indexPath)
        nycSchoolID = nycSchool.schoolID
        Constants.schoolDBN = nycSchoolID
        performSegue(withIdentifier: "nycSchoolDetailsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nycSchoolDetailsSegue", let nycDetailsVC = segue.destination as? NYCSchoolDetailsViewController {
            nycDetailsVC.nycSchoolID = nycSchoolID
        }
    }
    
    private func loadNYCSchools() {
        nycSchoolViewModel.fetchNYCSchoolsData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
