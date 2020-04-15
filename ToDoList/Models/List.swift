//
//  List.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 04.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import Foundation
import RealmSwift

class List: Object {

    @objc dynamic var title: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var isHightPriority: Bool = false
    @objc dynamic var isDone: Bool = false
}
