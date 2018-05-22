//
//  ViewController.swift
//  BullsEye
//
//  Created by De'Quan Weldon on 5/19/18.
//  Copyright © 2018 De'Quan Weldon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    let MAX = 100
    var previousValue = 0
    var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue = lroundf(slider.value)
        startNewRound()

        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // or UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") // or UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") // or UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") // or UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    func startNewRound() {
        round += 1
        targetValue = Int(arc4random_uniform(UInt32(MAX))) + 1
        sliderValue = 50
        slider.value = Float(sliderValue)
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")

        // Update the current value of the slider
        sliderValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {

        let difference = abs(sliderValue - targetValue)
        var points = MAX - difference

        let alertTitle: String
        var message: String
        let actionTitle: String

        switch difference {
        case 0:
            alertTitle = "Perfect Score! 😃"
            message = "You scored 💯 points!"
            actionTitle = "Awesome!"
        case 1...5:
            alertTitle = "Very Close!"
            message = "You scored \(points) points"
            actionTitle = "Getting Closer"

        case 6...10:
            alertTitle = "You Almost Had It!"
            message = "You scored \(points) points"
            actionTitle = "Do Better"
        default:
            alertTitle = "Not Even Close...😕"
            message = "You only scored \(points) points"
            actionTitle = "Do Better"
        }

        // Add bonus points if user scores 100 twice in a row
        if round == 1 {
            previousValue = points
            currentValue = points
        } else {
            previousValue = currentValue
            currentValue = points
        }
        if previousValue == MAX && currentValue == MAX {
            points += 100
            message += " 100 Bonus Points For Back To Back 💯's!"
        }

        // Update score
        score += points

        let alert = UIAlertController(
            title: alertTitle,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: actionTitle,
            style: .default,
            handler: {
            action in
            self.startNewRound()
            }
        )

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }


}

