//
//  ViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        activityIndicator.startAnimating()
        
        let network = Networking()
        network.fetch(resource: "albums", model: Album.self) { results in
            let albums:[Album] = results as! [Album]
            self.resultsTextView.isHidden = false
            self.resultsTextView.text = albums.first!.title
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    @IBOutlet weak var resultsTextView: UITextView!

    fileprivate func setupActivityIndicator() {
        

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        
        let centerXConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        let centerYConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        
        let height = activityIndicator.heightAnchor.constraint(equalToConstant:20)
        let width = activityIndicator.widthAnchor.constraint(equalToConstant: 20)
        
        let constraints = [height, width, centerXConstraint, centerYConstraint]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
//        let greenView = UIView(frame: .zero)
//        greenView.backgroundColor = UIColor.green
//        let topConstaint = greenView.topAnchor.constraint(equalTo:                self.view.topAnchor, constant: 50.0)
//        let leadinigConstaint = greenView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0)
//        let trailingConstaint = greenView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0)
