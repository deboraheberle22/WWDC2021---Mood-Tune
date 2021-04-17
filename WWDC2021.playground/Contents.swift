import PlaygroundSupport
import SpriteKit
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 900, height: 1000))
if let scene = IntroScene(fileNamed: "IntroScene") {
    scene.scaleMode = .aspectFit

    
    sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}


