//
//  StudentTableViewCell.swift
//  02_01_2023_TableViewProtocolDelegateDemo
//
//  Created by Vishal Jagtap on 01/02/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var studentFirstNameLabel: UILabel!
    @IBOutlet weak var studentLastNameLabel: UILabel!
    @IBOutlet weak var studentPhoneNumberLabel: UILabel!
    @IBOutlet weak var studentCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
