import UIKit
import SpriteKit
import PlaygroundSupport

open class ArtViewController: UIViewController {
    
    var scene = ArtScene()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let view = SKView()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        self.view = view
    }
}

extension ArtViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        
        switch message{
        case let .integer(info):
            scene.numParticles = info
            scene.start()
            break
        case let .string(info):
            if info == "play" {
                scene.isPlaying = true
            } else if info == "pause" {
                scene.isPlaying = false
            }
        default:
            print("mensagem não tratada")
        }
    }
}
