//
//  QuestionsDisplayTableViewCell.swift
//  StackOverflowQuestionsDisplay
//
//  Created by Madhu on 01/04/18.
//  Copyright © 2018 Madhu. All rights reserved.
//

import UIKit

class QuestionsDisplayTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var questionsDisplayLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
