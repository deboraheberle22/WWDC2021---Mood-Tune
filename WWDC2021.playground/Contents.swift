//: A SpriteKit based Playground
import PlaygroundSupport
import SpriteKit

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 900, height: 1000))

if let scene = IntroScene(fileNamed: "IntroScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFit
    
    // Present the scene
    sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}
 
