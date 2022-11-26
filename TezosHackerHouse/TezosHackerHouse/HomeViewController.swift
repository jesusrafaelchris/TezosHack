//
//  ViewController.swift
//  TezosHackerHouse
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var topBarView: TopBarView = {
        let topBarView = TopBarView()
        return topBarView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        view.backgroundColor = .white
    }
    
    func setUpView(){
        view.addSubview(topBarView)
        
        topBarView.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
    }
}
