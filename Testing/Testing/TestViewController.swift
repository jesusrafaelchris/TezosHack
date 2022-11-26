//
//  TestViewController.swift
//  Testing
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit

class TestViewController: UIViewController {
    
    lazy var Label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        view.addSubview(Label)
        
        NSLayoutConstraint.activate([
            Label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            Label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
        ])
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
