//
//  ViewController.swift
//  Testing
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. 3D model
        let sphere = MeshResource.generateSphere (radius: 0.05)
        let material = SimpleMaterial(color: .red, roughness: 0, isMetallic: true)
        let sphereEntity = ModelEntity(mesh: sphere, materials: [material])
        //2. Create Anchor
        let sphereAnchor = AnchorEntity (world: SIMD3(x: 0, y: 0, z: 0))
        sphereAnchor.addChild(sphereEntity)
        //3. Add anchor to scene
        arView.scene.addAnchor(sphereAnchor)
    }
}
