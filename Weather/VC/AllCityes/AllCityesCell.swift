//
//  AllCityesCell.swift
//  Weather
//
//  Created by Алексей Логинов on 17.12.2021.
//

import UIKit

class AllCityesCell: UITableViewCell {
    
    @IBOutlet weak var cityesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
