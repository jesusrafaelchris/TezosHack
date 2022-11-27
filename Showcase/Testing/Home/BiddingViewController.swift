//
//  BiddingViewController.swift
//  TezosHackerHouse
//
//  Created by Artemiy Malyshau on 26/11/2022.
//

import UIKit

class BiddingViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.layout(colour: .black, size: 24, text: "Tezos Owl #2951", bold: true)
        return title
    }()
    
    lazy var heartButton: UIButton = {
        let addButton = UIButton()
        addButton.setsizedImage(symbol: "heart", size: 16, colour: .gray)
        return addButton
    }()
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "NFT4")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = .white
    }
    
    func setUpView() {
        
        view.addSubview(titleLabel)
        view.addSubview(heartButton)
        view.addSubview(logoImage)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: logoImage.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        heartButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: logoImage.rightAnchor, paddingRight: 8, width: 35, height: 35)
        
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 120, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 350, height: 350)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
