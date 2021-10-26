//
//  NYCSchoolTableViewCell.swift
//  20211015-TylerDonohue-NYCSchools
//
//  Created by Tyler Donohue on 10/16/21.
//

import UIKit

class NYCSchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var NYCSchoolName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
