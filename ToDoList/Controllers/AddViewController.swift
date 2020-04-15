//
//  AddViewController.swift
//  ToDoList
//
//  Created by Фарид Гулиев on 04.04.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private var saveButton: UIButton!
    @IBOutlet private var prioritySegment: UISegmentedControl!
    @IBOutlet private var titleField: UITextField!
    @IBOutlet private var datePicker: UIDatePicker!
    
    //MARK: - Services
    private let realm = RealmService()
    
    //MARK: - Constants
    weak var delegate: ListViewDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
    }
    
    //MARK: - Setup UI Elements
    private func setupButtons() {
        saveButton.layer.cornerRadius = 5
        saveButton.clipsToBounds = true
    }
    
    //MARK: - Dismiss Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    //MARK: - IBActions
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let list = List()
        let dateString: String = datePicker.date.toString()
        let isHightPriority: Bool = prioritySegment.selectedSegmentIndex == 0 ? false : true
        list.title = titleField.text!
        list.date = dateString
        list.isHightPriority = isHightPriority
        realm.save(object: list)
        delegate?.update()
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneKeyboardButtonPressed(_ sender: UITextField) {
        view.endEditing(true)
    }
}
