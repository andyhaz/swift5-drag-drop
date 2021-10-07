//
//  GameScene.swift
//  swift5-SpritKit-template
//
//  Created by andyhaz on 10/5/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let label = SKLabelNode()
    let blueBin = SKSpriteNode()
    let yellowBin = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        print("init")
        setupDragLabel()
        setupTargets()

    }

    func setupDragLabel(){
        //set the font and position of the label
        label.fontName = "Chalkduster";
        label.fontSize = 20
        label.position = CGPoint(x: frame.midX, y: frame.midY+100)
            
        //get a random Bool
    let blue = Bool.random() //for <Swift 4.2 use arc4random_uniform(2) == 0
            
        //depending on the random number set the text and name to either Blue or Yellow
        if  blue
        {
            label.text = "blue"
            label.name = "blue"
        }else{
            label.text = "yellow"
            label.name = "yellow"
        }
            
        //add the label to the scene
        addChild(label)
    }
    //
    func setupTargets(){
            
    //setup the yellow bin with colour, dimensions and add to scene
    yellowBin.color = SKColor.yellow
    yellowBin.size = CGSize(width: 100, height: 100)
    yellowBin.position = CGPoint(x: 200, y: 200)
    addChild(yellowBin)
            
    //note that we can determine property of a fixed type using shorthand, shown here for setting colour
    blueBin.color = SKColor.blue
    blueBin.size = CGSize(width: 100, height: 100)
    blueBin.position = CGPoint(x: 200, y:400)
    addChild(blueBin)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
             //  let location = touch.location(in: self)
             //  print(location)
           }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get a touch
        let touch = touches.first!
            
        //if it started in the label, move it to the new location
        if label.frame.contains(touch.previousLocation(in: self)){
            label.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //if label is called yellow and its centre is inside the yellow target
         if label.name == "yellow"{
             if yellowBin.frame.contains(label.position){
                 //remove it and create a new label
                 label.removeFromParent()
                 setupDragLabel()
             }
         }
             
         //same process for blue label
         if label.name == "blue"{
             if blueBin.frame.contains(label.position){
                 //remove it and create a new label
                 label.removeFromParent()
                 setupDragLabel()
             }
         }
    }
}
