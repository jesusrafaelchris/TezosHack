//
//  LoginViewController.swift
//  TezosHackerHouse
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setsizedImage(symbol: "plus", size: 12, colour: .white)
        addButton.backgroundColor = .darkGray
        addButton.layer.cornerRadius = 17
        addButton.layer.masksToBounds = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setupButtonTargets()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = .orange
    }
    
    func setupButtonTargets() {
        addButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc func goToLogin() {
        let vc = HomeViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setUpView() {
        
        view.addSubview(addButton)
        
        addButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 34, height: 34)
        
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

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
