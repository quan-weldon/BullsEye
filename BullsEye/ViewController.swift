//
//  ViewController.swift
//  BullsEye
//
//  Created by De'Quan Weldon on 5/19/18.
//  Copyright © 2018 De'Quan Weldon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(
            title: "Hello, Word",
            message: "You read World but it's Word",
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }


}

