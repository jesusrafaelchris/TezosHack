import UIKit
import RealityKit
import ARKit
import FocusEntity
import Combine

typealias EntityCompletion = (ModelEntity) -> ()

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var modelEntities = [ModelEntity]()
    var isEditingModel = false
    var cancellable: AnyCancellable? = nil
    
    var models: [NFTModel] = [
        NFTModel(thumbnail: "toy_robot_vintage", model: "toy_robot_vintage.usdz"),
        NFTModel(thumbnail: "cup_saucer_set", model: "cup_saucer_set.usdz"),
        NFTModel(thumbnail: "sneaker_airforce", model: "sneaker_airforce.usdz"),
        NFTModel(thumbnail: "chair_swan", model: "chair_swan.usdz"),
        NFTModel(thumbnail: "gramophone", model: "gramophone.usdz"),
        NFTModel(thumbnail: "teapot", model: "teapot.usdz"),
        NFTModel(thumbnail: "tv_retro", model: "tv_retro.usdz"),
        NFTModel(thumbnail: "wateringcan", model: "wateringcan"),
    ]

    lazy var addNFTLabel: UILabel = {
        let text = UILabel()
        text.text = "Add your Artwork"
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textColor = .black
        return text
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var selectedModel: String = ""
    var selectedAModel = false
    
    var bottomView: UIView = {
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
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 18
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return bottomView
    }()
    
    lazy var MyNFTsLabel: UILabel = {
        let text = UILabel()
        text.text = "My Collection"
        text.font = UIFont.boldSystemFont(ofSize: 25)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var NFTCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(NFTCell.self, forCellWithReuseIdentifier: "NFTCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.allowsMultipleSelection = false
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Coaching overlay
        arView.addCoaching()
        // 1 Plane Detection
        startPlaneDetection()
        // 2 Tapping to add Objects
        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        setupView()
        let _ = FocusEntity(on: self.arView, focus: .classic)
    }
    
    @IBAction func undo(_ sender: Any) {
        // get current array
        guard let lastPlaced = modelEntities.last else {return}
        // delete last one
        lastPlaced.removeFromParent()
        modelEntities.removeLast()
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        for model in modelEntities {
            model.removeFromParent()
        }
        modelEntities.removeAll()
    }
    
    @IBAction func editMode(_ sender: Any) {
        if isEditingModel == false {
            isEditingModel = true
            for model in modelEntities {
                model.generateCollisionShapes(recursive: true)
                // Allow rotation, scale, position
                arView.installGestures([.all], for: model)
            }
        }
        
        else if isEditingModel == true {
            isEditingModel = false
        }
    }
    
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func setupView() {
        view.addSubview(bottomView)
        bottomView.addSubview(MyNFTsLabel)
        bottomView.addSubview(NFTCollectionView)
        //bottomView.addSubview(editButton)
        
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        MyNFTsLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 24).isActive = true
        MyNFTsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        NFTCollectionView.topAnchor.constraint(equalTo: MyNFTsLabel.bottomAnchor, constant: 24).isActive = true
        NFTCollectionView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16).isActive = true
        NFTCollectionView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        NFTCollectionView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        //editButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 24).isActive = true
        //editButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16).isActive = true
    }
    
    func startPlaneDetection() {
        arView.automaticallyConfigureSession = true
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.environmentTexturing = .automatic
        
        arView.session.run(configuration)
    }
    
    @objc func handleTap(recogniser: UITapGestureRecognizer) {
        print("tapped")
        // Location
        let location = recogniser.location(in: arView)
        
        if let _ = arView.entity(at: location) as? ModelEntity {
            // show modal to buy
            let detailViewController = PlaceBidVC()
            detailViewController.modalPresentationStyle = .formSheet
            present(detailViewController, animated: true, completion: nil)
        }
        else {
            //Raycast
            let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
            
            if let firstResult = results.first {
                print("found result")
                //3D point
                let worldPos = simd_make_float3(firstResult.worldTransform.columns.3)
                
                //Create plane
                guard selectedAModel == true else {return}
                let model = createModel { model in
                    self.modelEntities.append(model)
                    
                    //place object in world
                    self.placeObject(object: model, at: worldPos)
                }
            }
        }
    }
    
    func createModel(completion: @escaping EntityCompletion) {
        
        cancellable = Entity.loadModelAsync(named: self.selectedModel)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Unable to load a model due to error \(error)")
                }
                self.cancellable?.cancel()
                
            }, receiveValue: { [self] (model: Entity) in
                if let model = model as? ModelEntity {
                    cancellable?.cancel()
                    print("Congrats! Model is successfully loaded!")
                    completion(model)
                }
            })
    }
    
    func placeObject(object: ModelEntity, at location: SIMD3<Float>) {
        // Anchor
        let objectAnchor = AnchorEntity(world: location)
        
        // Tie model to anchor
        objectAnchor.addChild(object)
        
        // Add anchor to scene
        arView.scene.addAnchor(objectAnchor)
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NFTCell", for: indexPath) as! NFTCell
        let model = models[indexPath.item]
        cell.imageView.image = UIImage(named: model.thumbnail)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(100)
        let itemHeight = CGFloat(100)
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped cell")
        //let cell = cellForItem(at: indexPath) as!
        selectedAModel = true
        let model = models[indexPath.item]
        self.selectedModel = model.model
    }
}

