//
//  SettingsView.swift
//  Fireworks 2.0
//
//  Created by Andrew Madsen on 8/14/18.
//  Copyright © 2018 Andrew Madsen. All rights reserved.
//

import Foundation
import UIKit

class SettingsLauncher: UIViewController {
    
    var isRecording: Bool = false
    var hasTrails: Bool = false
    let instruments: [InstrumentType] = [.piano, .guitar]
    @IBOutlet weak var instrumentsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instrumentsStackView.translatesAutoresizingMaskIntoConstraints = false
        for instrument in instruments {
            let instrumentButton = UIButton()
            instrumentButton.setTitle("\(instrument)".titlecased(), for: .normal)
            instrumentButton.setTitleColor(UIColor(red: 0, green: 122.0 / 255, blue: 1, alpha: 1), for: .normal)
            instrumentButton.setTitleColor(UIColor(red: 207.0 / 255, green: 230.0 / 255, blue: 1, alpha: 1), for: .highlighted)
            instrumentButton.addTarget(self, action: #selector(instrumentButtonTapped), for: .touchUpInside)
            instrumentsStackView.addArrangedSubview(instrumentButton)
        }
        let trailsButton = UIButton()
        trailsButton.setTitle("Trails", for: .normal)
        trailsButton.setTitleColor(UIColor(red: 0, green: 122.0 / 255, blue: 1, alpha: 1), for: .normal)
        trailsButton.setTitleColor(UIColor(red: 207.0 / 255, green: 230.0 / 255, blue: 1, alpha: 1), for: .highlighted)
        trailsButton.addTarget(self, action: #selector(instrumentButtonTapped), for: .touchUpInside)
        //Thank you for providing me with the default color values in your enum Swift, I really appreciate it!
        instrumentsStackView.addArrangedSubview(trailsButton)
    }
    
    @objc func instrumentButtonTapped(_ sender: UIButton)
    {
        if sender.title(for: .normal) == "Trails" {
            //Set things to trails
        }
        else {
            for instrument in instruments {
                if sender.title(for: .normal)!.lowercased() == "\(instrument)" {
                    //Set things to that instrument
                    break
                }
            }
        }
    }
    
    @IBAction func trailsSwitched(_ sender: UISwitch) {
        hasTrails = sender.isOn
    }
    
    @IBAction func toggleRecording(_ sender: UIButton) {
        isRecording = !isRecording
        sender.setTitle(isRecording ? "End Recording" : "Start Recording", for: .normal)
    }
    
    @IBAction func viewRecordings(_ sender: UIButton) {
        performSegue(withIdentifier: "viewWithListOfRecordings", sender: nil)
    }
}

enum InstrumentType
{
    case piano, guitar
}

extension String
{
    func titlecased() -> String
    {
        var newString = ""
        for word in self.split(separator: " ")
        {
            newString += "\(String(word.first!).uppercased())\(word.dropFirst().lowercased())"
        }
        return newString
    }
}

