//
//  Date + ToString.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 05.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

extension Date {
    func toString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy hh:mm a"
        return dateFormater.string(from: self)
    }
}
