//
//  WordViewCell.swift
//  Translate
//
//  Created by Alexandra Gorshkova on 03/06/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit

class WordViewCell: UITableViewCell {
    @IBOutlet weak var translate: UILabel!
    @IBOutlet weak var word: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
