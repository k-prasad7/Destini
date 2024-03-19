//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choiceAButton: UIButton!
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var choiceBButton: UIButton!
    
    var storyGraph = StoryGraph()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        updateUI()
    }

    private func configureButtons() {
        [choiceAButton, choiceBButton].forEach { button in
            button?.titleLabel?.adjustsFontSizeToFitWidth = true
            button?.titleLabel?.minimumScaleFactor = 0.5
            button?.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        }
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        guard let userChoice = sender.titleLabel?.text else { return }
        storyGraph.nextStory(userChoice: userChoice)
        updateUI()
    }

    func updateUI(){
        storyText.text = storyGraph.getCurrentStory().text
        let choices = storyGraph.getCurrentChoices()
        choiceAButton.setTitle(choices[0].text, for: .normal)
        choiceBButton.setTitle(choices[1].text, for: .normal)
    }

}

