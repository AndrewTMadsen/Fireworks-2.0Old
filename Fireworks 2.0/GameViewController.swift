//
//  GameViewController.swift
//  Fireworks 2.0
//
//  Created by Andrew Madsen on 7/11/18.
//  Copyright © 2018 Andrew Madsen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import ReplayKit

class GameViewController: UIViewController, RPPreviewViewControllerDelegate, RecorderDelegate {
    
    var startTime: TimeInterval = 0
    var timeKeep: [TimeInterval: CGPoint] = [:]
    let recorder = RPScreenRecorder.shared()
    private var isRecording = false
    @IBAction func RecordingTapped(_ sender: Any) {
        
        if !isRecording {
            startRecording()
        } else {
            stopRecording()
        }
        
    }
    
    func fireworkHasFired(point: CGPoint) {
        if isRecording {
            timeKeep[NSDate.timeIntervalSinceReferenceDate - startTime] = point
        }
        
    }
    
    func startRecording() {
        startTime = NSDate.timeIntervalSinceReferenceDate
        self.isRecording = true
    }
    
    
    func stopRecording() {
    startTime = 0
    self.isRecording = false
        /*
         for (thing, thing) in dictionary
         {
            //put into coredata
         }
 */
    }
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") as? GameScene {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    let settingsLauncher = SettingsLauncher()
    
    func handleMore() {
        settingsLauncher.present(settingsLauncher, animated: true, completion: nil)
    }
    
    @IBAction func change(_ sender: UIButton) {
    handleMore()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
