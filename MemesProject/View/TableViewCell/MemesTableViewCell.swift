//
//  MemesTableViewCell.swift
//  MemesProject
//
//  Created by Raşit Kaplan on 5.08.2022.
//

import UIKit

class MemesTableViewCell: UITableViewCell {

    @IBOutlet weak var memesİmageView: UIImageView!
    @IBOutlet weak var memesNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
