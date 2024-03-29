import Foundation
import SpriteKit
import AVFoundation
import AppKit

public class IntroScene: SKScene {
    
    var greenCharacter : SKSpriteNode!
    var redCharacter : SKSpriteNode!
    var purpleCharacter : SKSpriteNode!
    
    var nextButtom : SKSpriteNode!
    var greenCharacterBaloon : SKSpriteNode!
    
    override public func didMove(to view: SKView) {
        
        greenCharacter = (self.childNode(withName: "greenCharacter") as! SKSpriteNode)
        redCharacter = (self.childNode(withName: "greenCharacter") as! SKSpriteNode)
        purpleCharacter = (self.childNode(withName: "greenCharacter") as! SKSpriteNode)
        nextButtom = (self.childNode(withName: "nextButtom") as! SKSpriteNode)
        greenCharacterBaloon = (self.childNode(withName: "greenCharacter") as! SKSpriteNode)
        
    }
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

      
    func touchDown(atPoint pos : CGPoint) {
        if nextButtom.contains(pos) {
            
            if let scene = IntroScene2(fileNamed: "IntroScene2") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                
                // Present the scene
                self.view!.presentScene(scene)
                
            }
        }
    }
    override public func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
        
}
    
        
        
            
        
        
    
    
    



