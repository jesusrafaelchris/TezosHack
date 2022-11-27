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
}
