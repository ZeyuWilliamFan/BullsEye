//
//  ViewController.swift
//  BullsEye
//
//  Created by Zeyu Fan on 15/6/20.
//  Copyright (c) 2015年 Zeyu Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var AvgscoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var targetValue: Int = 0
    var score:Int = 0
    var round = 1
    var avgScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
            slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
            slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") { let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal) }
        startNewgame()
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewRound ()
    {
        slider.value = Float(50)
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = lroundf(slider.value)
    }
    
    func startNewgame()
    {
        score = 0
        round = 1
        avgScore = 0
        startNewRound()
        updateEverything()
    }

    func updateEverything()
    {
        updateLabel()
        updateRound()
        updateScore()
        updateAvgLabel()
    }
    
    func updateAvgLabel()
    {
        AvgscoreLabel.text = String(avgScore)
    }
    
    func updateLabel ()
    {
        targetLabel.text = String(targetValue)
    }
    func updateScore()
    {
        scoreLabel.text = String(score)
    }
    func updateRound()
    {
        roundLabel.text = String(round)
    }
    
    @IBAction func showAlert()
    {
        let difference = abs(currentValue - targetValue)
        let points:Int = (100 - difference)
        var title: String
        
        if difference == 0
        {
            title = "Perfect!"
        }
        else if difference < 5
        {
            title = "You most had it!"
        }
        else if difference < 10
        {
            title = "Pretty good!"
        }
        else
        {
            title = "Not even close..."
        }
        
        score += points
        avgScore = Int(score/(round))
        
        round += 1
        
        let message = "The value of the slider is \(currentValue)"
                        + "\n Your score is: \(points)"
        
        let alert = UIAlertController ( title:title,
                                        message: message,
                                        preferredStyle: .Alert)
    
        let action = UIAlertAction (title:"OK", style: .Default, handler: {_ in self.startNewRound()
                                                                                self.updateEverything()   })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOver()
    {
        startNewgame()
    }

    @IBAction func sliderMoved(slider: UISlider)
    {
        currentValue = lroundf(slider.value)
        println("The value of the slider is now: \(slider.value)")
    }
}

