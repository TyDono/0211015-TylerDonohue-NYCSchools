//
//  NYCSchoolDetailsViewController.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/16/21.
//

import UIKit

class NYCSchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var nycSchoolNameLabel: UILabel!
    @IBOutlet weak var satMathLabel: UILabel!
    @IBOutlet weak var satReadingLabel: UILabel!
    @IBOutlet weak var satWritingLabel: UILabel!
    
    var nycSchoolID: String = ""
    var nycSchoolDetailsViewModel = NYCSchoolDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNYCSchoolDetails()
    }
    
    private func loadNYCSchoolDetails() {
        nycSchoolDetailsViewModel.fetchNYCSchoolData { [weak self] in
            let nycSchoolDetails = self?.nycSchoolDetailsViewModel.accessSchoolDetails()
            self?.satMathLabel.text = "Math SAT score average: \(nycSchoolDetails?.mathSATAverage ?? "No Score Available")"
            self?.satWritingLabel.text = "Writing SAT score average: \(nycSchoolDetails?.writingSATAverage ?? "No Score Available")"
            self?.satReadingLabel.text = "Reading SAT score average: \(nycSchoolDetails?.readingSATAverage ?? "No Score Available")"
            self?.nycSchoolNameLabel.text = nycSchoolDetails?.schoolName
            DispatchQueue.main.async {
                self?.reloadInputViews()
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
