//
//  ViewController.swift
//  How Is Matt?
//
//  Created by John Gallaugher on 9/19/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var alrightLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func alrightStepper(_ sender: UIStepper) {
        alrightLabel.text = String(Int(stepper.value))
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer, loops: Int) {
        // Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            // check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.numberOfLoops = loops - 1
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            // if reading in the NSDataAsset didn't work, report the error.
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    @IBAction func tellMePressed(_ sender: UIButton) {
        let loops = Int(alrightLabel.text!)!
        if loops > 0 {
            playSound(soundName: "alright", audioPlayer: &audioPlayer, loops: loops)
        }

    }
    

}

