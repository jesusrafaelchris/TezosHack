//
//  TopBarView.swift
//  TezosHackerHouse
//
//  Created by Artemiy Malyshau on 26/11/2022.
//

import UIKit

class TopBarView: UIView {

    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Member1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()

    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 16, text: "Hi, Artemiy!", bold: false)
        return text
    }()

    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .darkGray, size: 14, text: " tz1NL1dcZXBahtZZFPkHri5pkQjE3uCmvTrJ " , bold: true)
        text.backgroundColor = .black.withAlphaComponent(0.1)
        text.layer.cornerRadius = 4
        text.layer.masksToBounds = true
        return text
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(dateLabel)
        addSubview(titleLabel)
        
        profileImage.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 100, height: 100)
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        
        dateLabel.anchor(top: profileImage.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        titleLabel.anchor(top: dateLabel.bottomAnchor, paddingTop: 8, bottom: bottomAnchor, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
