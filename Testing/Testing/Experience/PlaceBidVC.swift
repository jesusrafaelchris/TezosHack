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
        text.text = "Make\nartwork bid"
        text.font = UIFont.boldSystemFont(ofSize: 60)
        text.textColor = .white
        text.numberOfLines = 0
        return text
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
        imageView.addSubview(blurView)
        imageView.addSubview(addNFTLabel)
        
        imageView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        blurView.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        addNFTLabel.anchor(top: view.topAnchor, paddingTop: 50, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
}
