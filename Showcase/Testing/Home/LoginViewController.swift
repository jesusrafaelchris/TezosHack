//
//  LoginViewController.swift
//  TezosHackerHouse
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    lazy var titleText: UILabel = {
        let titleText = UILabel()
        titleText.layout(colour: .black, size: 30, text: "Testname", bold: true)
        return titleText
    }()
    
    lazy var troublesText: UILabel = {
        let titleText = UILabel()
        titleText.layout(colour: .darkGray, size: 14, text: "Having troubles?", bold: true)
        return titleText
    }()
    
    lazy var eraseText: UILabel = {
        let titleText = UILabel()
        titleText.layout(colour: .orange, size: 12, text: "Erase Data", bold: true)
        return titleText
    }()
    
    lazy var maskButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .white, backgroundColour: nil, size: 18, text: "MetaMask", image: nil, cornerRadius: nil)
        button.backgroundColor = .metaBlue
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var metaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MetaMaskIcon")
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setupButtonTargets()
        
        view.backgroundColor = .white
        
        self.navigationItem.hidesBackButton = true

    }
    
    func setupButtonTargets() {
        maskButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc func goToLogin() {
        goToHome()
    }
    
    func login() {

    }
    
    func goToHome() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "tabBar") as! TabBarController
            self.navigationController?.pushViewController(destinationVC, animated: false)
        }
    }
    
    func setUpView() {
        
        view.addSubview(logoImage)
        view.addSubview(titleText)
        
        view.addSubview(maskButton)
        maskButton.addSubview(metaImage)
        
        view.addSubview(troublesText)
        view.addSubview(eraseText)
        
    
        
        logoImage.anchor(top: view.topAnchor, paddingTop: 175, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 75, right: nil, paddingRight: 0, width: 80, height: 80)
        
        titleText.anchor(top: logoImage.topAnchor, paddingTop: 28, bottom: nil, paddingBottom: 0, left: logoImage.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        maskButton.anchor(top: nil, paddingTop: 0, bottom: troublesText.topAnchor, paddingBottom: 140, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 300, height: 50)
        maskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        metaImage.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: maskButton.leftAnchor, paddingLeft: 20, right: nil, paddingRight: 0, width: 35, height: 35)
        metaImage.centerYAnchor.constraint(equalTo: maskButton.centerYAnchor).isActive = true
        
        troublesText.anchor(top: nil, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 65, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        troublesText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        eraseText.anchor(top: nil, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 45, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        eraseText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
