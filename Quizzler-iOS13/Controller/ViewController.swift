//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtScore: UILabel!
    @IBOutlet weak var txtQuestion: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizzBrain = QuizzBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func btnQuestion(_ sender: UIButton) {
        if quizzBrain.checkAnswer(sender.currentTitle) {
            // CORRECT
            sender.backgroundColor = UIColor.green
        } else {
            // WRONG
            sender.backgroundColor = UIColor.red
        }
        
        quizzBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        txtQuestion.text = quizzBrain.getQuestionText()
        progressBar.setProgress(quizzBrain.getProgress(), animated: true)
        txtScore.text = "Score: \(quizzBrain.getScore())"
        btnTrue.backgroundColor = UIColor.clear
        btnFalse.backgroundColor = UIColor.clear
    }
    
}

