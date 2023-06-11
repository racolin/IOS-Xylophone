//
//  ViewController.swift
//  Xylophone
//
//  Created by Administrator on 10/06/2023.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.currentTitle ?? "C")
        print(sender.title(for: .normal))
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            sender.layer.opacity = 1
        }
        playSound(name:sender.titleLabel?.text ?? "C")
    }
    
    func playSound(name : String) {
        
        guard let path = Bundle.main.path(forResource: name, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

