//
//  ViewController.swift
//  Pocket-Xylophone
//
//  Created by Jacob Haff on 6/2/20.
//  Copyright © 2020 Jacob Haff. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(note: (sender.currentTitle!))
        dimButton(button: sender)
    }
    
    func dimButton(button: UIButton){
        //Reduces the sender's opacity to half.

        button.alpha = 0.5
        
        //Code executes after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity  up
            button.alpha = 1.0
        }
    }
    
    func playSound(note: String) {
        let url = Bundle.main.url(forResource: "Sounds/\(note)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

