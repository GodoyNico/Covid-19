//#-hidden-code
import PlaygroundSupport
import Particles
import SpriteKit
import SwiftUI
//#-end-hidden-code
/*:
#Timeline Covid-19
 Particle Systemssss
 */
var numParticles: Int = /*#-editable-code*/10/*#-end-editable-code*/
//#-hidden-code
public func startSystem() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    remoteView.send(.integer(numParticles))
}

public func playSystem() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    remoteView.send(.string("play"))
}

public func pauseSystem() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    remoteView.send(.string("pause"))
}

startSystem()
//#-end-hidden-code
/*:#localized(key: "text2")
 Particle Systems
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, playSystem(), pauseSystem())
//#-editable-code

//#-end-editable-code

func slider
