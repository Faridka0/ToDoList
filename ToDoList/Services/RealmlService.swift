//
//  RealmlService.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 05.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    private let realm = try! Realm()
    
    func read<T: Object>(_: T.Type) -> [T] {
        return Array(realm.objects(T.self))
    }
    
    func save(object: Object) {
        try? realm.write {
            realm.add(object)
        }
    }
    
    func delete(object: Object) {
        try? realm.write {
            realm.delete(object)
        }
    }
    
    func updateList(object: List) {
        try? realm.write {
            object.isDone.toggle()
        }
    }
}
