import Foundation
import SpriteKit
import AVFoundation
import AppKit

public class GameScene: SKScene {
    
    var blueCircle: SKSpriteNode!
    var blueHexagon: SKSpriteNode!
    var blueSquare: SKSpriteNode!
    var orangeCircle: SKSpriteNode!
    var orangeHexagon: SKSpriteNode!
    var orangeSquare: SKSpriteNode!
    var yellowCircle: SKSpriteNode!
    var yellowHexagon: SKSpriteNode!
    var yellowSquare: SKSpriteNode!
    
    var circleArea: SKSpriteNode!
    var squareArea: SKSpriteNode!
    var hexagonArea: SKSpriteNode!
    
    var selectedShape: SKSpriteNode?
    var musicPlayers: [NSSound] = []
    var musicNames = ["blueCircleSound","blueHexagonSound","blueSquareSound","orangeCircleSound","orangeHexagonSound","orangeSquareSound", "yellowCircleSound", "yellowHexagonSound", "yellowSquareSound"]
    
    func loadMusicPlayers (){
        for name in musicNames {
            var player: NSSound
    print (name)
           
            
            let url: URL = Bundle.main.url(forResource: name, withExtension: "mp3")!
            player = NSSound (contentsOf: url, byReference:true)!
             
            player.loops = true // Repete música
              
              player.volume =  0 // seleciona o volume
              player.play() // Toca a música
            musicPlayers.append(player)
        }
        
    }
    
    override public func didMove(to view: SKView) {
        
        loadMusicPlayers()
        // Get label node from scene and store it for use later
        
        blueCircle = (self.childNode(withName: "blueCircle") as! SKSpriteNode)
        blueHexagon = ( self.childNode(withName: "blueHexagon") as! SKSpriteNode )
        blueSquare = (self.childNode(withName: "blueSquare") as! SKSpriteNode)
        orangeCircle = (self.childNode(withName: "orangeCircle") as! SKSpriteNode)
        orangeHexagon = (self.childNode(withName: "orangeHexagon") as! SKSpriteNode)
        orangeSquare = (self.childNode(withName: "orangeSquare") as! SKSpriteNode)
        yellowCircle = (self.childNode(withName: "yellowCircle") as! SKSpriteNode)
        yellowHexagon = (self.childNode(withName: "yellowHexagon") as! SKSpriteNode)
        yellowSquare = (self.childNode(withName: "yellowSquare") as! SKSpriteNode)
        
        
        circleArea = (self.childNode(withName: "circleArea") as! SKSpriteNode)
        squareArea = ( self.childNode(withName: "squareArea") as! SKSpriteNode )
        hexagonArea = (self.childNode(withName: "hexagonArea") as! SKSpriteNode)
        
    }
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) { // funcao para arrastar as formas //
        if blueCircle.contains(pos){
            selectedShape = blueCircle
        }
        if blueHexagon.contains(pos){
            selectedShape = blueHexagon
        }
        if blueSquare.contains(pos){
            selectedShape = blueSquare
        }
        if orangeCircle.contains(pos) {
            selectedShape = orangeCircle
            
        }
        if orangeHexagon.contains(pos) {
            selectedShape = orangeHexagon
        }
        if orangeSquare.contains(pos) {
            selectedShape = orangeSquare
        }
        if yellowCircle.contains(pos) {
            selectedShape = yellowCircle
        }
        if yellowHexagon.contains(pos) {
            selectedShape = yellowHexagon
        }
        if yellowSquare.contains(pos) {
            selectedShape = yellowSquare
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if selectedShape != nil{
            selectedShape?.position = pos
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        guard let selectedShape = selectedShape else {
            return
        
        }
        
        let musicName = getMusicName(from: selectedShape.name!)
        let playerIndex = musicNames.firstIndex(of: musicName)
        let player = musicPlayers [playerIndex!]
        
        if selectedShape.name!.contains("Circle"){
        
            if circleArea.intersects(selectedShape){
                selectedShape.position = circleArea.position
                player.volume = 0.1
            }
            
            else {
                player.volume = 0
            }

        }
        if selectedShape.name!.contains("Square"){
        
            if squareArea.intersects(selectedShape){
                selectedShape.position = squareArea.position
                player.volume = 0.1
            }
            
            else {
                player.volume = 0
            }
        }
        if selectedShape.name!.contains("Hexagon"){
        
            if hexagonArea.intersects(selectedShape){
                selectedShape.position = hexagonArea.position
                player.volume = 0.1
            }
            
            else {
                player.volume = 0
            }
        }
        self.selectedShape = nil
    }
    
    
    override public func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
    
    override public func mouseDragged(with event: NSEvent) {
        touchMoved(toPoint: event.location(in: self))
    }
    
    override public func mouseUp(with event: NSEvent) {
        touchUp(atPoint: event.location(in: self))
    }
    
    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    func getMusicName (from nodeName: String) -> String {
        let shapes = ["Circle", "Square", "Hexagon"]
        let colors = ["blue", "orange", "yellow"]
        for shape in shapes {
          if nodeName.contains(shape) {
            for color in colors {
              if nodeName.contains(color) {
                return color + shape + "Sound"
              }
            }
          }
        }
           
        return ""
    }
}
