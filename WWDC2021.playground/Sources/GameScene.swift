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
    
    var initialBlueCircleArea : SKSpriteNode!
    var initialBlueHexagonArea : SKSpriteNode!
    var initialBlueSquareArea : SKSpriteNode!
    var initialOrangeCircleArea : SKSpriteNode!
    var initialOrangeSquareArea : SKSpriteNode!
    var initialOrangeHexagonArea : SKSpriteNode!
    var initialYellowCircleArea : SKSpriteNode!
    var initialYellowSquareArea : SKSpriteNode!
    var initialYellowHexagonArea : SKSpriteNode!
    
    
    var firstBallon: SKSpriteNode!
    var finalBaloon: SKSpriteNode!
    
    var circleArea: SKSpriteNode!
    var squareArea: SKSpriteNode!
    var hexagonArea: SKSpriteNode!
    
    var fullCircle = false
    var fullSquare = false
    var fullHexagon = false

    var color1 = false
    var color2 = false
    var color3 = false
    
    var background : SKSpriteNode!
    var greenCharacter : SKSpriteNode!
    
    var selectedShape: SKSpriteNode?
    var musicPlayers: [NSSound] = []
    var musicNames = ["blueCircleSound","blueHexagonSound","blueSquareSound","orangeCircleSound","orangeHexagonSound","orangeSquareSound", "yellowCircleSound", "yellowHexagonSound", "yellowSquareSound"]
    
    func loadMusicPlayers (){
        for name in musicNames {
            var player: NSSound
   // print (name)
           
            
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
        blueHexagon = ( self.childNode(withName: "blueHexagon") as! SKSpriteNode)
        blueSquare = (self.childNode(withName: "blueSquare") as! SKSpriteNode)
        orangeCircle = (self.childNode(withName: "orangeCircle") as! SKSpriteNode)
        orangeHexagon = (self.childNode(withName: "orangeHexagon") as! SKSpriteNode)
        orangeSquare = (self.childNode(withName: "orangeSquare") as! SKSpriteNode)
        yellowCircle = (self.childNode(withName: "yellowCircle") as! SKSpriteNode)
        yellowHexagon = (self.childNode(withName: "yellowHexagon") as! SKSpriteNode)
        yellowSquare = (self.childNode(withName: "yellowSquare") as! SKSpriteNode)
        
        initialBlueCircleArea = (self.childNode(withName: "initialBlueCircleArea") as! SKSpriteNode)
        initialBlueHexagonArea = (self.childNode(withName: "initialBlueHexagonArea") as! SKSpriteNode)
        initialBlueSquareArea = (self.childNode(withName: "initialBlueSquareArea") as! SKSpriteNode)
        initialOrangeCircleArea = (self.childNode(withName: "initialOrangeCircleArea") as! SKSpriteNode)
        initialOrangeSquareArea = (self.childNode(withName: "initialOrangeSquareArea") as! SKSpriteNode)
        initialOrangeHexagonArea = (self.childNode(withName: "initialOrangeHexagonArea") as! SKSpriteNode)
        initialYellowCircleArea = (self.childNode(withName: "initialYellowCircleArea") as! SKSpriteNode)
        initialYellowSquareArea = (self.childNode(withName: "initialYellowSquareArea") as! SKSpriteNode)
        initialYellowHexagonArea = (self.childNode(withName: "initialYellowHexagonArea") as! SKSpriteNode)
        
        firstBallon = (self.childNode(withName: "firstBallon") as! SKSpriteNode)
        finalBaloon = (self.childNode(withName: "finalBaloon") as! SKSpriteNode)
        
        
        circleArea = (self.childNode(withName: "circleArea") as! SKSpriteNode)
        squareArea = ( self.childNode(withName: "squareArea") as! SKSpriteNode)
        hexagonArea = (self.childNode(withName: "hexagonArea") as! SKSpriteNode)
        
        background = (self.childNode(withName: "background2") as! SKSpriteNode)
        greenCharacter = (self.childNode(withName: "greenCharacter") as! SKSpriteNode)
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
            color1 = true
        }
        if blueHexagon.contains(pos){
            
            selectedShape = blueHexagon
            color2 = true
        }
        if blueSquare.contains(pos){
            
            selectedShape = blueSquare
            color3 = true
        }
        if orangeCircle.contains(pos) {
            
            selectedShape = orangeCircle
            color1 = false
            
        }
        if orangeHexagon.contains(pos) {
         
            selectedShape = orangeHexagon
            color2 = false
        }
        if orangeSquare.contains(pos) {
           
            selectedShape = orangeSquare
            color3 = false
        }
        if yellowCircle.contains(pos) {
           
            selectedShape = yellowCircle
            color1 = false
        }
        if yellowHexagon.contains(pos) {
            
            selectedShape = yellowHexagon
            color2 = false
        }
        if yellowSquare.contains(pos) {
            
            selectedShape = yellowSquare
            color3 = false
        }
        if circleArea.contains(pos){
            fullCircle = false
        }
        if squareArea.contains(pos){
            fullSquare = false
        }
        if hexagonArea.contains(pos){
            fullHexagon = false
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
        
        if selectedShape.name!.contains("Circle")  {
            
        
            if circleArea.contains(pos) && fullCircle == false {
                selectedShape.position = circleArea.position
                player.volume = 0.1
                fullCircle = true
            }
            
            else {
                if selectedShape.name!.contains("blue"){
                    selectedShape.run(SKAction.move(to: initialBlueCircleArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("yellow"){
                    selectedShape.run(SKAction.move(to: initialYellowCircleArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("orange"){
                    selectedShape.run(SKAction.move(to: initialOrangeCircleArea.position, duration: 0.2))
                }
                player.volume = 0
            
            }

        }
        else if selectedShape.name!.contains("Square") {
            
        
            if squareArea.contains(pos) && fullSquare == false {
                selectedShape.position = squareArea.position
                player.volume = 0.1
                fullSquare = true
            }
            
            else {
                if selectedShape.name!.contains("blue"){
                    selectedShape.run(SKAction.move(to: initialBlueSquareArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("yellow"){
                    selectedShape.run(SKAction.move(to: initialYellowSquareArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("orange"){
                    selectedShape.run(SKAction.move(to: initialOrangeSquareArea.position, duration: 0.2))
                }
                player.volume = 0
                
            }
        }
       else if selectedShape.name!.contains("Hexagon") {
            
        
            if hexagonArea.contains(pos) && fullHexagon == false {
                selectedShape.position = hexagonArea.position
                player.volume = 0.1
                fullHexagon = true
            }
            
            else {
                if selectedShape.name!.contains("blue"){
                    selectedShape.run(SKAction.move(to: initialBlueHexagonArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("yellow"){
                    selectedShape.run(SKAction.move(to: initialYellowHexagonArea.position, duration: 0.2))
                    
                } else if selectedShape.name!.contains("orange"){
                    selectedShape.run(SKAction.move(to: initialOrangeHexagonArea.position, duration: 0.2))
                }
                player.volume = 0
               
            }
       }
       
       else {
        if selectedShape.name!.contains("Circle") {
            color1 = false
        }
        if selectedShape.name!.contains("Square") {
            color2 = false
        }
        if selectedShape.name!.contains("Hexagon") {
            color3 = false
        }
        
        
       }
        if color1 && color2 && color3 {
            
            background.texture = SKTexture (imageNamed: "backGroundBlue2")
            greenCharacter.texture = SKTexture (imageNamed: "greenCharacter2")
            firstBallon.alpha = 0
            finalBaloon.alpha = 1
            
            
            
        }
        
        if fullCircle == true && fullSquare == true && fullHexagon == true {
            
            if !(color1 && color2 && color3) {
                
                firstBallon.alpha = 1
                
            }
            else {
                
                firstBallon.alpha = 0
                
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
