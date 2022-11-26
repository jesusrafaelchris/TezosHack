import UIKit
import ARKit
import Realitykit

class ExperienceViewController: UIViewController {
    
    let arview = ARView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. 3D model
//        let sphere = MeshResource.generateSphere (radius: 0.05)
//        let material = SimpleMaterial (color: .red, roughness: 0, isMetallic: true)
//        let sphere Entity = ModelEntity (mesh: sphere, materials: [material])
//        //2. Create Anchor
//        let sphere Anchor = AnchorEntity (world: SIMD3(x: 0, y: 0, z: 0))
//        sphereAnchor.addChild(sphere Entity)
//        //3. Add anchor to scene
//        arView.scene.addAnchor (sphereAnchor)
//
        
       // setupView()
        
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience
//        Experience.loadBox()
        
        // Add the box anchor to the scene
       // arview.scene.anchors.append(boxAnchor)
    }
        
        
//        ARview.backgroundColor = .red
        
//
//        // Start AR session
        //let session = ARview.session
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = [.horizontal]
//        session.run(config)
//
//        // Add coaching overlay
//        let coachingOverlay = ARCoachingOverlayView()
//        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        coachingOverlay.session = session
//        coachingOverlay.goal = .horizontalPlane
//        ARview.addSubview(coachingOverlay)
//
//        // Set debug options
//        #if DEBUG
//        ARview.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
//        #endif


    
//    func setupView() {
//        view.addSubview(ARview)
//
//        NSLayoutConstraint.activate([
//            ARview.topAnchor.constraint(equalTo: view.topAnchor),
//            ARview.leftAnchor.constraint(equalTo: view.leftAnchor),
//            ARview.rightAnchor.constraint(equalTo: view.rightAnchor),
//            ARview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
}
