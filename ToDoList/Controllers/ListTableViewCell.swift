//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 05.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var priorityImage: UIImageView!
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Configure
    public func configure(list: List) {
        title.text = list.title
        date.text = list.date
        priorityImage.isHidden = !list.isHightPriority
    }
}
