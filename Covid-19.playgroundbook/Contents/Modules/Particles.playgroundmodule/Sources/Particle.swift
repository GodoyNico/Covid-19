import SpriteKit

open class Particle {
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var shape: PShape
    var color: UIColor
    
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    
    init() {
        x = 0
        y = 0
        size = 10
        shape = .circle
        color = #colorLiteral(red: 0.9998682141, green: 0.8477882147, blue: 0.4652701616, alpha: 1.0)
    }
    
    init(x: CGFloat, y: CGFloat, size: CGFloat, shape: PShape, color: UIColor) {
        self.x = x
        self.y = y
        self.size = size
        self.color = color
        self.shape = shape
    }
    
    func addSpeed(vx: CGFloat, vy: CGFloat) {
        self.vx += vx
        self.vy += vy
    }
    
    func update() {
        self.x += self.vx
        self.y += self.vy
    }
    
    func getShape() -> SKShapeNode {
        var node = SKShapeNode(circleOfRadius: size)
        if shape == .rectangle {
            node = SKShapeNode(rectOf: CGSize(width: size*2, height: size*2))
        }
        node.fillColor = color
        node.lineWidth = 0
        node.position = CGPoint(x: x, y: y)
        return node
    }
}

enum PShape {
    case circle
    case rectangle
}
