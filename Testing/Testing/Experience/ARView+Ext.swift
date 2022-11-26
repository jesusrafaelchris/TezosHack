import RealityKit
import ARKit
import UIKit

extension ARView {
    
    func addCoaching() {
        let coachingOverlay = ARCoachingOverlayView(frame: self.bounds)
        coachingOverlay.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]
        self.addSubview(coachingOverlay)
        coachingOverlay.goal = .anyPlane
        coachingOverlay.session = self.session
    }
    
    
//    func enableObjectRemoval() {
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
//        self.addGestureRecognizer(longPressGesture)
//    }
//
//    @objc func handleLongPress(_ recogniser: UILongPressGestureRecognizer) {
//        let tapLocation = recogniser.location(in: self)
//        if let entity = entity(at: tapLocation) as? ModelEntity {
//            entity.removeFromParent()
//        }
//    }
}
