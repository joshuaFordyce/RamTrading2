//
//  HomeTableViewCell.swift
//  RamTrading2
//
//  Created by Joshua Fordyce on 3/27/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var StockSymbol: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
