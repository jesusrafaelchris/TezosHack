import UIKit

class BidCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MetaMaskIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 18, text: "Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .darkGray, size: 14, text: "Technology, Hackathon", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var rankLabel: UILabel = {
        let rank = UILabel()
        rank.layout(colour: .black, size: 14, text: "1", bold: true)
        return rank
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.layout(colour: .black, size: 16, text: "614XTZ", bold: true)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: bid) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.name
        descriptionLabel.text = data.hash
        percentLabel.text = data.price
    }
    
    func setupView() {
        addSubview(rankLabel)
        addSubview(imageView)
        addSubview(featuredStackView)
        addSubview(percentLabel)
        
        imageView.anchor(top: topAnchor, paddingTop: 6, bottom: bottomAnchor, paddingBottom: 6, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 14, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        featuredStackView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        percentLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
