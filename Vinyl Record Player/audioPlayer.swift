//
//  audioPlayer.swift
//  Vinyl Record Player
//
//  Created by Vladimir Vinakheras on 23.01.2024.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    print(sound, type)
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch{
            print("Could not find and play the sound file")
        }
    }
   
}
