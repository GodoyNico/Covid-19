import SpriteKit
import PlaygroundSupport

open class ArtScene: SKScene {
    var particles: [Particle] = []
    open var numParticles: Int = 50
    var colors: [UIColor] = [#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    open var isPlaying: Bool = true
    
    open override func sceneDidLoad() {
        self.backgroundColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    open func start() {
        particles = []
        for i in 0..<numParticles {
            var p = Particle()
            if self.size.width > 0 {
                p.x = CGFloat.random(in: 0..<size.width)
                p.y = CGFloat.random(in: 0..<size.height)
                p.size = CGFloat.random(in: 2...10)
                p.color = colors[ Int.random(in: 0..<colors.count) ]
                
                p.addSpeed(vx: CGFloat.random(in: -3...3), vy: CGFloat.random(in: -3...3))
            }
            particles.append(p)
        }
    }
    
    open override func didChangeSize(_ oldSize: CGSize) {
        start()
    }
    
    open func draw() {
        self.removeAllChildren()
        for i in 0..<numParticles{
            self.addChild(particles[i].getShape())
        }
    }
    
    open override func update(_ currentTime: TimeInterval) {
        if isPlaying {
            for i in 0..<numParticles{
                if particles[i].x > size.width || particles[i].x < 0 {
                    particles[i].vx = -particles[i].vx
                }
                if particles[i].y > size.height || particles[i].y < 0 {
                    particles[i].vy = -particles[i].vy
                }
                particles[i].update()
            }
        }
        draw()
    }
}
