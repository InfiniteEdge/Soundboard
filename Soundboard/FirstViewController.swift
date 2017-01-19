//
//  FirstViewController.swift
//  Soundboard
//
//  Created by Nicholas Karsten on 1/16/17.
//  Copyright © 2017 Nicholas Karsten. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController
{
    let soundFilenames = ["Klingon", "SHUTUP", "Dragon Scream", "Dial-Up"]
    
    var audioPlayers = [AVAudioPlayer]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for sound in soundFilenames
        {
            do
            {
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "mp3")!)
                
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                
                audioPlayers.append(audioPlayer)
                
            }
            catch
            {
                //Catch error that's thrown
                audioPlayers.append(AVAudioPlayer())
            }
        }
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonTapped(_ sender: UIButton)
    {
        //Grab audio player that corresponds to button tapped
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
    
    
    
}

