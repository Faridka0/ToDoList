//
//  ListViewController.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 04.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

protocol ListViewDelegate: class {
    func update()
}

class ListViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var emptyLabel: UILabel!
    
    //MARK: - Services
    private let realm = RealmService()
    
    //MARK: - Constants
    private let cellID: String = "listCell"
    private let addSegueID: String = "addSegue"
    private var list: [List]? {
        didSet {
            if list?.count == 0 {
                tableView.alpha = 0
            } else {
                tableView.alpha = 1
                tableView.reloadData()
            }
        }
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    //MARK: - Load Data
    private func loadData() {
        list = realm.read(List.self)
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addSegueID {
            guard let destinationVC = segue.destination as? AddViewController else { return }
            destinationVC.delegate = self
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ListTableViewCell
        if let list = list?[indexPath.row] {
            cell.configure(list: list)
            cell.accessoryType = list.isDone ? .checkmark : .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let list = list?[indexPath.row] else { return }
        realm.updateList(object: list)
        cell.accessoryType = cell.accessoryType == .none ? .checkmark : .none
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let list = list?[indexPath.row] else { return }
            self.realm.delete(object: list)
            self.loadData()
        }
    }
}

//MARK: - ListViewDelegate
extension ListViewController: ListViewDelegate {
    func update() {
        loadData()
    }
}
