//
//  AudioManager.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/8/23.
//

import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    private init() {}
    
    var player = AVAudioPlayer()
    
    func playAudio(with trackName: String) {
        guard let url = Bundle.main.url(forResource: trackName, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.player.play()
        }
    }
}
