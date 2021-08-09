//
//  DetailViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/6/21.
//

import UIKit

class DetailViewController: UIViewController {
    var todo: Todo!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = todo.title
        // Using Ternary operator
        statusLabel.text = todo.completed ? "Completed: Yes" : "Completed: No"
    }
}
