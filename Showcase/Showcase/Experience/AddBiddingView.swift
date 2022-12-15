import UIKit

class AddBiddingView: UIView {
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .white, backgroundColour: .clear, size: 24, text: "   +   ", image: nil, cornerRadius: 0)
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var budgetValue: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 24, text: "300 XTZ", bold: true)
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .white, backgroundColour: .clear, size: 24, text: "   -   ", image: nil, cornerRadius: 0)
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 18
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(budgetValue)
        stackView.addArrangedSubview(plusButton)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonStackView)
        buttonStackView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
