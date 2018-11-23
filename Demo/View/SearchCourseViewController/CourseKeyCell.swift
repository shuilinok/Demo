//
//  CourseKeyCell.swift
//  Demo
//
//  Created by Foryou on 2018/9/12.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class CourseKeyCell: UITableViewCell {

    
    @IBOutlet var titleLabel : UILabel?
    var item : CourseKeyCellItem?
    {
        didSet{
                self.titleLabel?.text = self.item?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
