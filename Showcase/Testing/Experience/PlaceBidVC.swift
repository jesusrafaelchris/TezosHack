import UIKit
import RealityKit
import ARKit

class PlaceBidVC: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "NFT6")
        return imageView
    }()
    
    lazy var addNFTLabel: UILabel = {
        let text = UILabel()
        text.text = "Make artwork bid"
        text.font = UIFont.boldSystemFont(ofSize: 34)
        text.textAlignment = .center
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
    
    lazy var nftPicture: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "toy_robot_vintage")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var nftName: UILabel = {
        let text = UILabel()
        text.text = "NFT #1284"
        text.font = UIFont.boldSystemFont(ofSize: 24)
        text.textAlignment = .center
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
    
    lazy var nftDescription: UILabel = {
        let text = UILabel()
        text.text = "Bid on this NFT in order\nto obtain ownership of it."
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.textAlignment = .center
        text.textColor = .white
        text.numberOfLines = 0
        return text
    }()
    
    lazy var bidButton: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .clear, size: 24, text: "Place bid", image: nil, cornerRadius: 0)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    lazy var addBudget: AddBiddingView = {
        let addBidding = AddBiddingView()
        return addBidding
    }()
    
    var blurView: UIView = {
        let bottomView = UIView()
        //only apply the blur if the user hasn't disabled transparency effects
        if !UIAccessibility.isReduceTransparencyEnabled {
            bottomView.backgroundColor = .clear

            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = bottomView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            bottomView.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            bottomView.backgroundColor = .white
        }
        return bottomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(imageView)
        view.addSubview(blurView)
        view.addSubview(addNFTLabel)
        view.addSubview(nftPicture)
        view.addSubview(nftName)
        view.addSubview(nftDescription)
        view.addSubview(addBudget)
        view.addSubview(bidButton)
        
        imageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        blurView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        addNFTLabel.anchor(top: view.topAnchor, paddingTop: 50, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        addNFTLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nftPicture.anchor(top: addNFTLabel.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 300, height: 300)
        nftPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nftName.anchor(top: nftPicture.bottomAnchor, paddingTop: 25, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        nftName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nftDescription.anchor(top: nftName.bottomAnchor, paddingTop: 16, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        nftDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addBudget.anchor(top: nil, paddingTop: 0, bottom: bidButton.topAnchor, paddingBottom: 70, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        addBudget.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        bidButton.anchor(top: nil, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 50 , left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 300, height: 50)
        bidButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
}
