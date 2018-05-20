//
//  ViewController.swift
//  BullsEye
//
//  Created by De'Quan Weldon on 5/19/18.
//  Copyright © 2018 De'Quan Weldon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
    }

    func startNewRound() {
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")

        // Update the current value of the slider
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {

        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"

        let alert = UIAlertController(
            title: "Hello, Word",
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)

        // Start new round after user makes a guess
        startNewRound()
    }


}

