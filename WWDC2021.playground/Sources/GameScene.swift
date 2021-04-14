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
    
    var selectedCircle: SKSpriteNode?
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
            selectedCircle = blueCircle
        }
        if blueHexagon.contains(pos){
            selectedCircle = blueHexagon
        }
        if blueSquare.contains(pos){
            selectedCircle = blueSquare
        }
        if orangeCircle.contains(pos) {
            selectedCircle = orangeCircle
            
        }
        if orangeHexagon.contains(pos) {
            selectedCircle = orangeHexagon
        }
        if orangeSquare.contains(pos) {
            selectedCircle = orangeSquare
        }
        if yellowCircle.contains(pos) {
            selectedCircle = yellowCircle
        }
        if yellowHexagon.contains(pos) {
            selectedCircle = yellowHexagon
        }
        if yellowSquare.contains(pos) {
            selectedCircle = yellowSquare
        }
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if selectedCircle != nil{
            selectedCircle?.position = pos
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        guard let selectedCircle = selectedCircle else {
            return
        
        }
        if selectedCircle.name!.contains("Circle"){
        
            if circleArea.intersects(selectedCircle){
                selectedCircle.position = circleArea.position
            }
        }
        if selectedCircle.name!.contains("Square"){
        
            if squareArea.intersects(selectedCircle){
                selectedCircle.position = squareArea.position
            }
        }
        if selectedCircle.name!.contains("Hexagon"){
        
            if hexagonArea.intersects(selectedCircle){
                selectedCircle.position = hexagonArea.position
            }
        }
        let musicName = getMusicName(from: selectedCircle.name!)
        let playerIndex = musicNames.firstIndex(of: musicName)
        let player = musicPlayers [playerIndex!]
        player.volume = 0.3
        self.selectedCircle = nil
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
           
        return ""
    }
          }
        
